class ContactsSearch < Searchlight::Search

  search_on Contact.includes(:contact_memberships)

  searches :title, :description, :name, :department_id, :contact_group_id

  def search_title
    search.where "title LIKE :title", title: "%#{title}%"
  end

  def search_description
    search.where "description LIKE :description", description: "%#{description}%"
  end

  def search_name
    search.where "title LIKE :name OR description LIKE :name", name: "%#{name}%"
  end

  def search_department_id
    search.where department_id: department_id
  end

  def search_contact_group_id
    search.where "`contact_memberships`.`contact_group_id` = ?", contact_group_id
  end
end
