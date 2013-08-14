require 'spec_helper'

describe Website do
  it { should validate_presence_of :contact }
end
