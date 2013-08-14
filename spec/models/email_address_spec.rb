require 'spec_helper'

describe EmailAddress do
  it { should validate_presence_of :contact }
end
