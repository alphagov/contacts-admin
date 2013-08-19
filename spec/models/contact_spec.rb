require 'spec_helper'

describe Contact do
  it { should validate_presence_of :title }
  it { should validate_presence_of :contact_record }
  it { should validate_presence_of :department }
end
