module Admin
  class DestroyContactGroup
    include ::Contacts::Interactor

    takes(:contact_group)

    def destroy
      @contact_group.destroy if @contact_group.contacts.none?
    end
  end
end
