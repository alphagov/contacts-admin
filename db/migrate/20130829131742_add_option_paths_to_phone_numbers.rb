class AddOptionPathsToPhoneNumbers < ActiveRecord::Migration
  def change
    add_column :phone_numbers, :number_options_path, :string
    add_column :phone_numbers, :international_number_options_path, :string
  end
end
