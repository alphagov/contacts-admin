class AddDepartment < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :title
      t.string :slug
    end
    add_index :departments, :slug
  end
end
