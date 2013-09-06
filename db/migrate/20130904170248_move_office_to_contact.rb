class MoveOfficeToContact < ActiveRecord::Migration
  def up
    add_column :contacts, :slug, :string
    add_column :contacts, :title, :string
    add_index :contacts, :slug
  end
end
