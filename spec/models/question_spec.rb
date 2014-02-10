require "spec_helper"

describe Question do
  it { should validate_presence_of :title }
  it { should validate_presence_of :contact }
  it { should validate_presence_of :contact_group }
end
