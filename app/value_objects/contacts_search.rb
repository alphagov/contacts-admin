class ContactsSearch < Searchlight::Search
  search_on Contact.includes(:contact_memberships)

  searches :title, :description, :name, :organisation_id, :contact_group_id

  def name
    (super || "").strip
  end

  def search_name
    search.where("contacts.title LIKE :name OR contacts.description LIKE :name", name: "%#{name}%")
  end

  def search_organisation_id
    search.where organisation_id: organisation_id
  end

  def search_contact_group_id
    search.where("contact_memberships.contact_group_id = ?", contact_group_id).
      references(:contact_memberships)
  end
end
