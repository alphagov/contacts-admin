require 'spec_helper'

describe OrganisationSlugUpdater do
  let(:new_slug) { 'my-new-slug' }
  let(:old_slug) { 'my-old-slug' }
  let!(:organisation) { FactoryGirl.create(:organisation, slug: old_slug) }

  it 'returns true if updated' do
    expect(OrganisationSlugUpdater.new(old_slug, new_slug).call).to be_true
  end

  it 'updates the organisation slug' do
    OrganisationSlugUpdater.new(old_slug, new_slug).call
    expect(organisation.reload.slug).to eq(new_slug)
  end

  it 'doesnt contain a leading slash in the organisation slug if one is provided' do
    OrganisationSlugUpdater.new(old_slug, "/new-slug-with-leading-slash").call
    expect(organisation.reload.slug).to eq("new-slug-with-leading-slash")
  end

  it 'returns false if not updated' do
    expect(OrganisationSlugUpdater.new('anything', new_slug).call).to be_false
  end

  context 'when the organisation has associated contacts' do
    let(:contacts) { double(:contacts, any?: true) }

    before do
      allow_any_instance_of(Organisation).to receive(:contacts).and_return(contacts)
    end

    it 'should not update the organisation' do
      OrganisationSlugUpdater.new(old_slug, new_slug).call
      expect(organisation.reload.slug).to eq(old_slug)
    end

    it 'returns true in order to exit rake with a 0 exit code' do
      expect(OrganisationSlugUpdater.new(old_slug, new_slug).call).to be_true
    end
  end
end
