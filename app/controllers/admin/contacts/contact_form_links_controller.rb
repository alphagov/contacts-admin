class Admin::Contacts::ContactFormLinksController < AdminController
  before_action :load_parent_contact
  before_action :load_contact_form_link, only: %i[edit update destroy]

  def new
    @contact_form_link = @contact.contact_form_links.build
  end

  def create
    @contact_form_link = @contact.contact_form_links.build(contact_form_link_params)
    if @contact_form_link.save
      redirect_to [:admin, @contact, :contact_form_links], notice: "Contact Form Link successfully created"
    else
      render :new
    end
  end

  def update
    if @contact_form_link.update_attributes(contact_form_link_params)
      redirect_to [:admin, @contact, :contact_form_links], notice: "Contact Form Link successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @contact_form_link.destroy
    redirect_to [:admin, @contact, :contact_form_links], notice: "Contact Form Link successfully deleted"
  end

private

  def contact_form_link_params
    params.require(:contact_form_link).permit(:title, :description, :link)
  end

  def load_contact_form_link
    @contact_form_link = @contact.contact_form_links.find(params[:id])
  end
end
