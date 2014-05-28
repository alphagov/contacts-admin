class Admin::Contacts::PostAddressesController < AdminController
  before_filter :load_parent_contact
  before_filter :load_post_address, only: [:edit, :update, :destroy]

  def new
    @post_address = @contact.post_addresses.build
  end

  def create
    @post_address = @contact.post_addresses.build(post_address_params)
    if @post_address.save
      redirect_to [:admin, @contact, :post_addresses], notice: "Post Address successfully created"
    else
      render :new
    end
  end

  def update
    if @post_address.update_attributes(post_address_params)
      redirect_to [:admin, @contact, :post_addresses], notice: "Post Address successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @post_address.destroy
    redirect_to [:admin, @contact, :post_addresses], notice: "Post Address successfully deleted"
  end

private

  def post_address_params
    params.require(:post_address).permit(
      :title,
      :description,
      :address,
      :street_address,
      :locality,
      :region,
      :postal_code,
      :world_location_slug,
      :contact_type_id,
      :latitude,
      :longitude
    )
  end

  def load_post_address
    @post_address = @contact.post_addresses.find(params[:id])
  end
end
