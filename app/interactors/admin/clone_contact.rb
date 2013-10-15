module Admin
  class CloneContact
    include ::Contacts::Interactor

    takes(:contact)

    def clone
      clone = @contact.dup
      clone.save

      clone.contact_groups << @contact.contact_groups
      clone.save

      @contact.contact_form_links.each do |link|
        new_link = link.dup
        new_link.contact = clone
        new_link.save
      end

      @contact.phone_numbers.each do |number|
        new_number = number.dup
        new_number.contact = clone
        new_number.save
      end

      @contact.email_addresses.each do |email|
        new_email = email.dup
        new_email.contact = clone
        new_email.save
      end

      @contact.post_addresses.each do |address|
        new_address = address.dup
        new_address.contact = clone
        new_address.save
      end

      Contact.reset_counters(clone.id, :contact_form_links)
      Contact.reset_counters(clone.id, :phone_numbers)
      Contact.reset_counters(clone.id, :email_addresses)
      Contact.reset_counters(clone.id, :post_addresses)
      clone
    end
  end
end
