require "rails_helper"

describe ApplicationHelper, type: :helper do
  describe "#page_title" do
    it "returns GOV.UK for a normal page" do
      expect(helper.page_title(["Test Page"])).to eq("Test Page - GOV.UK")
    end
  end
end
