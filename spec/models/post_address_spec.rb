require 'spec_helper'

describe PostAddress do
  it { should validate_presence_of :contact }
  it { should validate_presence_of :title }
  it { should validate_presence_of :street_address }
  it { should validate_presence_of :postal_code }
  it { should validate_presence_of :world_location_slug }
end
