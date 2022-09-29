require "rails_helper"
require "gds_api/test_helpers/organisations"

describe ImportOrganisations, with_fakefs: true do
  include GdsApi::TestHelpers::Organisations

  it "creates new organisations when none exist" do
    organisation_slugs = %w[ministry-of-fun tea-agency]
    stub_organisations_api_has_organisations(organisation_slugs)

    expect(Organisation.all.count).to eq(0)

    ImportOrganisations.new.call

    expect(Organisation.all.count).to eq(2)
  end

  it "updates an existing organisation when its data changes" do
    slug = "ministry-of-fun"
    create(
      :organisation,
      title: "Ministry Of Misery",
      slug:,
    )
    expect(Organisation.count).to eq(1)

    stub_organisations_api_has_organisations([slug])

    ImportOrganisations.new.call

    expect(Organisation.count).to eq(1)

    expect(Organisation.find_by(slug:).title).to eq("Ministry Of Fun")
  end

  it "updates the child organisation with information about it's parent" do
    slug = "ministry-of-fun"
    fun = create(:organisation, title: "Ministry of Fun", slug:)
    child_slug = "ministry-of-fun-child-1" # hard-coded in gds_api_adapters
    movies = create(:organisation, title: "Ministry of Movies", slug: child_slug)

    stub_organisations_api_has_organisations([slug])

    ImportOrganisations.new.call

    expect(movies).to eq(fun.children.first)
  end

  it "saves values which are not validated for presence, when they are present in the data" do
    slug = "ministry-of-fun"
    stub_organisations_api_has_organisations([slug])

    ImportOrganisations.new.call

    organisation = Organisation.find_by(slug:)

    expect(organisation.abbreviation).not_to be_empty
  end
end
