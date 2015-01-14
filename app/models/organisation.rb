class Organisation < ActiveRecord::Base
  include FriendlyId

  before_validation :set_contact_index_content_id, on: :create

  friendly_id :slug

  has_ancestry

  has_many :contacts
  has_many :contact_groups

  validates :contact_index_content_id, presence: true

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

private

  def set_contact_index_content_id
    self.contact_index_content_id = SecureRandom.uuid
  end

end
