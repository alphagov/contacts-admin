require "spec_helper"

describe ContactGroup do
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :description }
end
