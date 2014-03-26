class CreateOrganisations < ActiveRecord::Migration
  def change
    create_table :organisations do |t|
      t.string :title
      t.string :format
      t.string :slug
      t.string :abbreviation
      t.string :govuk_status
      t.string :parent_organisation

      t.timestamps
    end
  end
end
