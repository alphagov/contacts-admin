class RemoveRelatedContentLinksCount < ActiveRecord::Migration
  class RelatedContentLink < Website
  end

  def change
    remove_column :contacts, :related_content_links_count
    RelatedContentLink.delete_all
  end
end
