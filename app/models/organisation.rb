class Organisation < ActiveRecord::Base
  include FriendlyId

  friendly_id :slug

  has_ancestry

  has_many :contacts
  has_many :contact_groups

  def title_with_abbreviation
    if abbreviation.present? && abbreviation != title
      # Use square brackets around the abbreviation
      # as Chosen doesn't like matching with
      # parentheses at the start of a word
      "#{title} [#{abbreviation}]"
    else
      title
    end
  end

  def abbreviation_or_title
    abbreviation || title
  end

  alias_method :to_s,      :title_with_abbreviation
  alias_method :logo_name, :title_with_abbreviation

  def path
    "/government/organisations/#{slug}"
  end

  def exempt?
    govuk_status == "exempt"
  end

  def as_json(options={})
    {
      id: id,
      title: title,
      format: format,
      slug: slug,
      abbreviation: abbreviation,
      govuk_status: govuk_status
    }
  end

end
