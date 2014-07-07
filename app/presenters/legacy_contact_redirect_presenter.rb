class LegacyContactRedirectPresenter

  attr_reader :contact

  def initialize(contact)
    @contact = contact
  end

  def present
    {
      base_path: legacy_url,
      format: "redirect",
      publishing_app: "contacts",
      public_updated_at: Time.zone.now,
      redirects: [
        { path: legacy_url, type: "exact", destination: contact.link }
      ],
    }
  end

  private

  def legacy_url
    "/contact/#{contact.organisation.slug}/#{contact.slug}"
  end

  class Index
    def present
      {
        base_path: "/contact/hm-revenue-customs",
        format: "redirect",
        publishing_app: "contacts",
        public_updated_at: Time.zone.now,
        redirects: [
          { path: "/contact/hm-revenue-customs", type: "exact", destination: "/government/organisations/hm-revenue-customs/contact" }
        ],
      }
    end
  end
end
