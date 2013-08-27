require 'spec_helper'

describe ContactFormLink do
  it { should validate_presence_of :title }
  it { should validate_presence_of :link }
end
