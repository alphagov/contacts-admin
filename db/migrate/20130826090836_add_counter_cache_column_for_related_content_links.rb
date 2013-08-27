class AddCounterCacheColumnForRelatedContentLinks < ActiveRecord::Migration
  def change
    rename_column :contact_records, :websites_count, :contact_form_links_count

    add_column :contact_records, :related_content_links_count, :integer, default: 0
  end
end
