require 'spec_helper'

describe Website do
  it { should validate_presence_of :contact_record }
  it { should validate_presence_of :title }
  it { should validate_presence_of :link }
end
