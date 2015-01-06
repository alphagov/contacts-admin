class ContactsSearch < Searchlight::Search
  search_on Contact.includes(:contact_memberships)

  searches :q, :organisation_id, :contact_group_id

  def q
    (super || "").strip
  end

  def search_q
    search.where("contacts.title LIKE :q OR contacts.description LIKE :q", q: "%#{q}%")
  end

  def search_organisation_id
    search.where organisation_id: organisation_id
  end

  def search_contact_group_id
    search.where("contact_memberships.contact_group_id = ?", contact_group_id).
      references(:contact_memberships)
  end
end
