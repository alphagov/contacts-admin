require 'spec_helper'
require 'fileutils'

describe ImportContacts, with_fakefs: true do
  let(:file_name) { 'contacts.csv' }

  describe 'initialisation' do
    context 'provided path does not exist' do
      it 'raises ArgumentError' do
        expect{
          ImportContacts.new('non-existent-path')
        }.to raise_error ArgumentError
      end
    end

    context 'provided path exists' do
      before {
        # prepare blank file
        FileUtils.touch(file_name)
      }

      it 'does not raise ArgumentError' do
        expect{
          ImportContacts.new(file_name)
        }.not_to raise_error
      end
    end
  end

  describe '#import' do
    let(:contact)         { double('Contact', save: true) }
    let(:contact_builder) { double('Contact Builder', build: contact) }

    before {
      # prepare file contents
      create_file file_name, %Q{header1,header2
        content1,content2}
    }

    it 'invokes contact builder which builds contact entry' do
      ImportContacts.new(file_name).import(contact_builder)

      expect(contact_builder).to have_received(:build)
    end

    it 'persists contact entry' do
      ImportContacts.new(file_name).import(contact_builder)

      expect(contact).to have_received(:save)
    end
  end
end
