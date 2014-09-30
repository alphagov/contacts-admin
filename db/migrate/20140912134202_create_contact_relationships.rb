class CreateContactRelationships < ActiveRecord::Migration
  def change
    create_table :contact_relationships, id: false do |t|
      t.references :contact, null: false, index: true
      t.references :related_contact, null: false
    end
  end
end
