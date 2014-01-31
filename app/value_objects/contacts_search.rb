class ContactsSearch < Searchlight::Search

  search_on Contact

  searches :title, :description

  def search_title
    search.where "title LIKE :title", title: "%#{title}%"
  end

  def search_description
    search.where "description LIKE :description", description: "%#{description}%"
  end
end
