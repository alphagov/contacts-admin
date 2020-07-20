module Admin
  class DestroyContactGroup
    def initialize(contact_group)
      @contact_group = contact_group
    end

    def call
      if @contact_group.contacts.none?
        @contact_group.destroy!
      else
        @contact_group.errors.add(:base, "Must reassign #{@contact_group.contacts.count} #{'contact'.pluralize(@contact_group.contacts.count)}")
        false
      end
    end
  end
end
