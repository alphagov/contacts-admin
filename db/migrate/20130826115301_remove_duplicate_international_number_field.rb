class RemoveDuplicateInternationalNumberField < ActiveRecord::Migration
  def change
    remove_column :phone_numbers, :international_number, :string
  end
end
