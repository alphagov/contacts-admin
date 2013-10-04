class AssociateQuestionsToContactGroups < ActiveRecord::Migration
  def change
    add_column :questions, :contact_group_id, :integer
    add_index :questions, :contact_group_id
  end
end
