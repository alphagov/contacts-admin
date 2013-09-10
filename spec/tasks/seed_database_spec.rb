require 'spec_helper'

describe SeedDatabase do
  describe '#run' do

    let!(:department)     { Department.create(title: 'example department') }

    before { described_class.instance.run }

    it 'creates mock user' do
      expect(User.count).to eq 1
      expect(User.find_by(email: 'winston@alphagov.co.uk')).to be_present
    end

    it 'creates ContactGroups' do
      expect(ContactGroup.count).to eq SeedDatabase::CONTACT_GROUPS.size
      expect(
        ContactGroup.where("contact_group_type_id IS NULL OR title IS NULL OR description IS NULL")
      ).to be_none
    end

    it 'creates HMRC department' do
      expect(Department.find_by(title: 'HMRC')).to be_present
    end
  end
end
