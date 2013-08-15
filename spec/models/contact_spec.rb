require 'spec_helper'

describe Contact do
  it { should validate_presence_of :title }
end
