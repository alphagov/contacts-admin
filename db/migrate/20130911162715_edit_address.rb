class EditAddress < ActiveRecord::Migration
  def change
    add_column :post_addresses, :street_address, :text
    add_column :post_addresses, :locality, :string
    add_column :post_addresses, :region, :string
    add_column :post_addresses, :postal_code, :string
    add_column :post_addresses, :world_location_slug, :string
    add_column :post_addresses, :contact_type_id, :integer
    add_column :post_addresses, :latitude, :decimal
    add_column :post_addresses, :longitude, :decimal
  end
end
