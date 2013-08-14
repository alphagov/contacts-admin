class CreateEmailAddresses < ActiveRecord::Migration
  def change
    create_table :email_addresses do |t|
      t.references :contact
      t.string :title
      t.text   :description
      t.string :email
      t.string :link
      t.text   :more_info
      t.timestamps
    end
  end
end
