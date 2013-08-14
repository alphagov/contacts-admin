require 'spec_helper'

describe Number do
  it { should validate_presence_of :contact }
  it { should validate_presence_of :title }
  it { should validate_presence_of :number }
end
