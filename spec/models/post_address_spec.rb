require 'spec_helper'

describe PostAddress do
  it { should validate_presence_of :contact }
end
