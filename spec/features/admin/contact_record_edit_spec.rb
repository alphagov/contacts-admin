require 'spec_helper'

describe 'Contact Record editing', auth: :user do
  include Admin::ContactRecordSteps

  let!(:contact_type)   { ContactType.create(title: 'new contact type') }
  let(:contact_record)  { create :contact_record  }

  before { verify contact_record_exists(contact_record) }

  specify 'it can be updated' do
    update_contact_record(contact_record, description: 'new description') do
      select contact_type, from: 'contact_record_contact_type_id'
    end

    verify contact_record_updated(contact_record, description: 'new description')

    expect(contact_record.reload.contact_type).to eq contact_type
  end
end
