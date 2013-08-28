require 'spec_helper'

describe ContactGroup do
  it { should validate_presence_of :contact_group_type }
  it { should validate_presence_of :title }
end
