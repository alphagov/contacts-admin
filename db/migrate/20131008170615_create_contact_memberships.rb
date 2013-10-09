class CreateContactMemberships < ActiveRecord::Migration
  def change
    create_table :contact_memberships do |t|
      t.belongs_to :contact
      t.belongs_to :contact_group
      t.timestamps
    end
  end
end
