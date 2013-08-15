require 'spec_helper'

describe EmailAddress do
  describe "validations" do
    it { should validate_presence_of :contact_record }
    it { should validate_presence_of :title }

    context 'more info text present' do
      subject { EmailAddress.new(more_info: 'text') }

      it { should_not validate_presence_of :email }
    end

    context 'more info text missing' do
      subject { EmailAddress.new(more_info: nil) }

      it { should validate_presence_of :email }
    end
  end
end
