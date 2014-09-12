class CreateContactRelationships < ActiveRecord::Migration
  def change
    create_table :contact_relationships, id: false do |t|
      t.references :contact
      t.references :related_contact, class_name: "Contact"

      t.index :contact_id
    end
  end
end
