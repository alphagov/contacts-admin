require "rails_helper"

RSpec.describe ContactGroup, type: :model do
  let(:item) { create(:contact_group) }
  it_behaves_like "a versioned data model"

  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :description }

  context "scoping" do
    it "should return most popular contact grouns" do
      popular_contact_group = create(:contact_group, contact_group_type: ContactGroupType.most_popular)
      create(:contact_group, contact_group_type: ContactGroupType.for_individuals)

      returned_scope = ContactGroup.most_popular
      expect(returned_scope.size).to eq 1
      expect(returned_scope.first).to eq popular_contact_group
    end

    it "should return all except most popular contact groups" do
      create(:contact_group, contact_group_type: ContactGroupType.most_popular)
      non_popular_contact_group = create(:contact_group, contact_group_type: ContactGroupType.for_individuals)

      returned_scope = ContactGroup.except_most_popular
      expect(returned_scope.size).to be 1
      expect(returned_scope.first).to eq non_popular_contact_group
    end
  end
end
