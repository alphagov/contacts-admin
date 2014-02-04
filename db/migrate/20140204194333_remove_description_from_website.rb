class RemoveDescriptionFromWebsite < ActiveRecord::Migration
  def change
    remove_column :websites, :description, :string
  end
end
