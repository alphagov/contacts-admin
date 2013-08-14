class CreateWebsites < ActiveRecord::Migration
  def change
    create_table :websites do |t|
      t.references :contact
      t.string :title
      t.text   :description
      t.string :link
      t.text   :more_info
      t.timestamps
    end

    add_index :websites, :contact_id
  end
end
