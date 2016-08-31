require "rails_helper"

RSpec.describe ContactGroup, type: :model do
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :description }
end
