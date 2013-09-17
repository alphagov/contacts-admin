class AddBeforeYouContactUsToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :before_you_contact_us, :text
  end
end
