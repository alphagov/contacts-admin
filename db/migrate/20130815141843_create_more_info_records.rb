class CreateMoreInfoRecords < ActiveRecord::Migration
  def change
    create_table :more_info_records do |t|
      t.references :contact_record
      t.string :type
      t.text   :heading
      t.text   :title
      t.text   :description
      t.text   :url
      t.timestamps
    end

    add_index :more_info_records, :contact_record_id
    add_index :more_info_records, :type
  end
end
