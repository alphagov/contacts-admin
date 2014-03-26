require "spec_helper"

describe Organisation do
  let!(:hmrc) { create :organisation }

  describe "#all" do
    it "should have only hmrc loaded" do
      Organisation.all.should eq([hmrc])
    end
  end
  describe "#load_organisations, #initialize" do
    it "should correctly create hmrc" do
      hmrc.title.should eq("HM Revenue & Customs")
      hmrc.format.should eq("Non-ministerial department")
      hmrc.slug.should eq("hm-revenue-customs")
      hmrc.abbreviation.should eq("HMRC")
    end
  end
  describe "#find HMRC" do
    it "should find hmrc by slug" do
      Organisation.find_by_slug("hm-revenue-customs").should eq(hmrc)
    end
  end
  
end
