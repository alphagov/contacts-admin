require 'spec_helper'

describe Office do
  it { should validate_presence_of :title }
  it { should validate_presence_of :contact }
  it { should validate_presence_of :department }
end
