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

    it 'assigns contact type' do
      contact_group = 'See also'
      attributes = {'clustergroup' => contact_group}

      expect(described_class.build(attributes).contact_group).to eq ContactGroup.find_by_title(contact_group)
    end
  end
end
