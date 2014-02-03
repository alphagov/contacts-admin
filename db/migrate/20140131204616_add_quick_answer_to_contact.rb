class AddQuickAnswerToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :quick_answer, :text
  end
end
