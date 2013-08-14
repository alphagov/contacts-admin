class CreateNumbers < ActiveRecord::Migration
  def change
    create_table :numbers do |t|
      t.references :contact
      t.string :title
      t.string :number
      t.string :international_number
      t.text   :description
      t.text   :open_hours
      t.text   :more_info
      t.timestamps
    end

    add_index :numbers, :contact_id
  end
end
