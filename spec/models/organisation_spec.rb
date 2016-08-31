require "spec_helper"

describe Organisation do
  subject(:organisation) { create :organisation, abbreviation: abbreviation, title: title }
  let(:title) { "HM Revenue & Customs" }
  let(:abbreviation) { "HMRC" }

  describe "#title_with_abbreviation" do
    context "when abbreviation is present" do
      it "should append abbreviation to the title" do
        expect(organisation.title_with_abbreviation).to eq("HM Revenue & Customs [HMRC]")
      end
    end

    context "when abbreviation is blank" do
      let(:abbreviation) { nil }

      it "should not append abbreviation to title" do
        expect(organisation.title_with_abbreviation).to eq("HM Revenue & Customs")
      end
    end
  end

  describe "#abbreviation_or_title" do
    context "when abbreviation is present" do
      it "should show abbreviation" do
        expect(organisation.abbreviation_or_title).to eq(abbreviation)
      end
    end

    context "when abbreviation is blank" do
      let(:abbreviation) { nil }

      it "should show title" do
        expect(organisation.abbreviation_or_title).to eq(title)
      end
    end
  end

  describe "#path" do
    it "should return correct path" do
      expect(organisation.path).to eq("/government/organisations/hm-revenue-customs")
    end
  end
end
