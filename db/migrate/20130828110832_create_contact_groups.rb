class CreateContactGroups < ActiveRecord::Migration
  def change
    create_table :contact_groups do |t|
      t.integer :contact_group_type_id
      t.string :title
      t.string :description
      t.integer :contacts_count
      t.timestamps
    end

    add_index :contact_groups, :contact_group_type_id
  end
end
