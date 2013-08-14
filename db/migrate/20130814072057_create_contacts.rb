class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :title
      t.integer :cluster_group_id
      t.text    :description
      t.text    :keywords

      t.timestamps
    end

    add_index :contacts, :cluster_group_id
  end
end
