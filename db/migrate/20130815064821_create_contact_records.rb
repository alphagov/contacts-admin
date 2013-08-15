class CreateContactRecords < ActiveRecord::Migration
  def up
    create_table :contact_records do |t|
      t.integer :contact_type_id
      t.text    :description
      t.text    :keywords
      t.text    :contact_form_url
      t.timestamps
    end

    remove_column :contacts, :contact_type_id
    remove_column :contacts, :description
    remove_column :contacts, :keywords
    remove_column :contacts, :contact_form_url

    add_column :contacts, :contact_record_id, :integer
    add_index :contacts, :contact_record_id
  end

  def down
    drop_table :contact_records

    add_column :contacts, :contact_type_id, :integer, null: false
    add_column :contacts, :description, :text
    add_column :contacts, :keywords, :text
    add_column :contacts, :contact_form_url, :text

    add_index :contacts, :contact_type_id

    remove_column :contacts, :contact_record_id
  end
end
