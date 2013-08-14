require 'spec_helper'

describe EmailAddress do
  it { should validate_presence_of :contact }
  it { should validate_presence_of :title }
  it { should validate_presence_of :email }
end
