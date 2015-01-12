class AddUniqueConstraintToOrganisationSlugs < ActiveRecord::Migration
  class Contact < ActiveRecord::Base
  end

  class Organisation < ActiveRecord::Base
    has_many :contacts
  end

  def remove_duplicate_slugs
    seen_slugs = Set.new
    Organisation.all.each do |organsition|
      if seen_slugs.include?(organsition.slug)
        if organsition.contacts.none?
          organsition.destroy!
        end
      else
        seen_slugs << organsition.slug
      end
    end
  end

  def up
    remove_duplicate_slugs

    add_index(:organisations, :slug, unique: true)
  end

  def down
    remove_index(:organisations, :slug)
  end
end
