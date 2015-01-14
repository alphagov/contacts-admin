require "spec_helper"

describe ContactsFinderPresenter do

  let(:group) { create :contact_group, :with_organisation }

  it "presents the exportable_attributes correctly" do
    presented = ContactsFinderPresenter.new(group.organisation).present

    expect(presented[:base_path]).to         include(group.organisation.slug)
    expect(presented[:title]).to             include(group.organisation.title)
    expect(presented[:public_updated_at]).to eq(group.updated_at.to_s)
  end
end
