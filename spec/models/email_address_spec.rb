require 'spec_helper'

describe EmailAddress do
  describe "validations" do
    it { should validate_presence_of :contact_record }
    it { should validate_presence_of :title }
    it { should validate_presence_of :email }
  end
end
