require "searchlight/adapters/action_view"

class ContactsSearch < Searchlight::Search
  include Searchlight::Adapters::ActionView

  def base_query
    Contact.includes(:contact_memberships)
  end

  def q
    (super || "").strip
  end

  def search_q
    query.where("contacts.title LIKE :q OR contacts.description LIKE :q", q: "%#{q}%")
  end

  def search_organisation_id
    query.where organisation_id: organisation_id
  end

  def search_contact_group_id
    query.where("contact_memberships.contact_group_id = ?", contact_group_id).
      references(:contact_memberships)
  end
end
