require 'spec_helper'

describe Number do
  it { should validate_presence_of :contact }
end
