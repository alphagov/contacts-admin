require "rails_helper"
require "gds-sso/lint/user_spec"

RSpec.describe User, type: :model do
  it_behaves_like "a gds-sso user class"

  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :email }
end
