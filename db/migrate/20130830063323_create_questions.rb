class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :office
      t.string :title
      t.timestamps
    end

    add_index :questions, :office_id
  end
end
