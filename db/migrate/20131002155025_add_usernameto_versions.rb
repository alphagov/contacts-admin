class AddUsernametoVersions < ActiveRecord::Migration
  def change
    add_column :versions, :user_name, :string
  end
end
