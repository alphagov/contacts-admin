require "lrucache"

class Department
  cattr_writer :departments

  attr_reader :id, :title, :format, :slug, :abbreviation, :govuk_status, :parent_organisations

  def self.cache
    @cache ||= LRUCache.new(soft_ttl: 1.day, ttl: 2.days)
  end

  def self.reset_cache
    @cache = nil
  end

  def self.cache_fetch(key)
    inner_exception = nil
    cache.fetch(key) do
      begin
        yield
      rescue GdsApi::BaseError => e
        inner_exception = e
        raise RuntimeError.new("use_stale_value")
      end
    end
  rescue RuntimeError => e
    if e.message == "use_stale_value"
      raise inner_exception
    else
      raise
    end
  end

  def initialize(org)
    @id = org.id
    @title = org.title
    @format = org.format
    @updated_at = Time.parse(org.updated_at) if org.updated_at
    @web_url = org.web_url
    @slug = org.details.slug
    @abbreviation = org.details.abbreviation
    @closed_at = Time.parse(org.details.closed_at) if org.details.closed_at
    @govuk_status = org.details.govuk_status
    @parent_organisations = org.parent_organisations
    @child_organisations = org.child_organisations
  end

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

  def to_param
    slug
  end

  def path
    "/government/organisations/#{slug}"
  end

  def exempt?
    govuk_status == "exempt"
  end

  def valid?
    true
  end

  def contacts
    Contact.where(department_id: slug).includes(:contact_memberships)
  end

  def contact_groups
    ContactGroup.where department_id: slug
  end

  def self.all
    cache_fetch("all") do
      load_departments
    end
  end

  def self.find(id)
    cache_fetch("department-#{id}") do
      all.find { |department| department.id == id }
    end
  end

  def self.first
    all.first
  end

  def self.find_by(attributes)
    all.find { |department|
      attributes.inject(true) { |prev, key|
        prev && department.send(key.first) == key.last
      }
    }
  end

  def self.find_by!(attributes)
    find_by(attributes) or raise ActiveRecord::RecordNotFound
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

  def self.load_departments
    (organisations_api.organisations.with_subsequent_pages || []).map { |org|
      new org
    }.reject { |dep| dep.exempt? }
  end

  def self.organisations_api
    Contacts.organisations_api
  end
end
