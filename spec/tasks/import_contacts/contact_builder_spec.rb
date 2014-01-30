require 'spec_helper'

describe ImportContacts::ContactBuilder do
  describe 'build' do
    it 'returns instance of Contact' do
      expect(described_class.build({})).to be_kind_of Contact
    end

    it 'assigns the first title to contact record' do
      title = "title1\ntitle2"
      attributes = {'title' => title}

      expect(described_class.build(attributes).title).to eq "title1"
    end

    it 'assigns description to contact record' do
      description = 'some description'
      attributes = {'description' => description}

      expect(described_class.build(attributes).description).to eq description
    end

    it 'assigns contact groups' do
      create(:contact_group, title: 'See also')
      contact_group = 'See also'
      attributes = {'clustergroup' => contact_group}

      expect(described_class.build(attributes).contact_groups).to eq [ContactGroup.find_by(title: contact_group)]
    end

    context 'HMRC department present' do
      let!(:department) { Department.find_by abbreviation: "HMRC" }

      it 'assigns HMRC department contact' do
        expect(described_class.build(department: department).department).to eq Department.find_by(abbreviation: "HMRC")
      end
    end

    context 'HMRC department missing' do
      it 'does not assign HMRC department to contact' do
        expect(described_class.build(department: nil).department).to be_blank
      end
    end
  end
end
