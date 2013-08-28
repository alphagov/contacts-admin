require 'spec_helper'

describe ContactGroup do
  it { should validate_presence_of :title }
end
