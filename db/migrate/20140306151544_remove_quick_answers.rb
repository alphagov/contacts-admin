class RemoveQuickAnswers < ActiveRecord::Migration
  def change
    remove_column :contacts, :quick_answer
  end
end
