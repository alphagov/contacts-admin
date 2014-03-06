class AddBestTimeToCallToPhoneNumber < ActiveRecord::Migration
  def change
    add_column :phone_numbers, :best_time_to_call, :text
  end
end
