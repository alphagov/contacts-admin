class RenameNumbersToPhoneNumbers < ActiveRecord::Migration
  def change
    rename_table :numbers, :phone_numbers

    rename_column :contact_records, :numbers_count, :phone_numbers_count
  end
end
