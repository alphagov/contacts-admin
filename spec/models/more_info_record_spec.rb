require 'spec_helper'

describe MoreInfoRecord do
  it { should validate_presence_of :url }
end
