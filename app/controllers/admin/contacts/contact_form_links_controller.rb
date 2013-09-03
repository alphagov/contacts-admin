module Admin
  module Contacts
    class ContactFormLinksController < AdminController
      expose(:contact)
      expose(:contact_form_links, ancestor: :contact)
      expose(:contact_form_link, attributes: :contact_form_link_params)

      before_filter :set_ariane

      def index
      end

      def new
        ariane.add "New Contact Form link"
      end

      def edit
        ariane.add "Editing #{contact_form_link.title}"
      end

      def create
        ariane.add "New Contact Form link"

        if contact_form_link.save
          redirect_to [:admin, contact, :contact_form_links], notice: 'Contact Form Link successfully created'
        else
          render :new
        end
      end

      def update
        ariane.add "Editing #{contact_form_link.title}"
        
        if contact_form_link.update_attributes(contact_form_link_params)
          redirect_to [:admin, contact, :contact_form_links], notice: 'Contact Form Link successfully updated'
        else
          render :edit
        end
      end

      def destroy
        contact_form_link.destroy

        redirect_to [:admin, contact, :contact_form_links], notice: 'Contact Form Link successfully deleted'
      end

      private

      def contact_form_link_params
        params.require(:contact_form_link).permit(:title, :description, :link)
      end

      def set_ariane
        ariane.add 'Contacts', admin_contacts_path
        ariane.add 'Edit Contact', edit_admin_contact_path(contact)
        ariane.add 'Contact Form links', admin_contact_contact_form_links_path(contact)
      end
    end
  end
end
