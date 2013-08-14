class CreatePostAddresses < ActiveRecord::Migration
  def change
    create_table :post_addresses do |t|
      t.references :contact
      t.string :title
      t.text   :description
      t.text   :address
      t.text   :more_info
      t.timestamps
    end

    add_index :post_addresses, :contact_id
  end
end
