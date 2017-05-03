class Admin::Contacts::EmailAddressesController < AdminController
  before_action :load_parent_contact
  before_action :load_email_address, only: [:edit, :update, :destroy]

  def new
    @email_address = @contact.email_addresses.build
  end

  def create
    @email_address = @contact.email_addresses.build(email_address_params)
    if @email_address.save
      redirect_to [:admin, @contact, :email_addresses], notice: "Email Address successfully created"
    else
      render :new
    end
  end

  def update
    if @email_address.update_attributes(email_address_params)
      redirect_to [:admin, @contact, :email_addresses], notice: "Email Address successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @email_address.destroy
    redirect_to [:admin, @contact, :email_addresses], notice: "Email Address successfully deleted"
  end

private

  def email_address_params
    params.require(:email_address).permit(:title, :description, :link, :email)
  end

  def load_email_address
    @email_address = @contact.email_addresses.find(params[:id])
  end
end
