module Admin
  module ContactsHelper
    def filter_terms_for_group(contact_group)
      [contact_group.to_s, contact_group.contacts.map(&:to_s)].flatten.join(" ")
    end
  end
end
