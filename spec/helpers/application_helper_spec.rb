require "rails_helper"

describe ApplicationHelper, type: :helper do
  describe "#page_title" do
    it "suffixes the title with 'GOV.UK'" do
      expect(helper.page_title("Test Page")).to eq("Test Page - GOV.UK")
    end

    it "joins title parts with dashes" do
      expect(helper.page_title("Foo", "Bar")).to eq("Foo - Bar - GOV.UK")
    end

    it "removes empty title parts" do
      expect(helper.page_title("Foo", "", "Bar")).to eq("Foo - Bar - GOV.UK")
    end
  end
end
