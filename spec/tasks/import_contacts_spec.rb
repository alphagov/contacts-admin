require 'spec_helper'
require 'fileutils'

describe ImportContacts, with_fakefs: true do
  describe '#import' do
    context 'provided path does not exist' do
      it 'raises ArgumentError' do
        expect{
          ImportContacts.new('non-existent-path')
        }.to raise_error ArgumentError
      end
    end

    context 'provided path exists' do
      let(:file_name) { 'contacts.csv' }

      before { FileUtils.touch(file_name)  }

      it 'does not raise ArgumentError' do
        expect{
          ImportContacts.new(file_name)
        }.not_to raise_error
      end
    end
  end
end
