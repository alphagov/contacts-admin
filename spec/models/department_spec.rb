require "spec_helper"

describe Department do
  let(:hmrc) { Department.first }

  describe "#all" do
    it "should have only hmrc loaded" do
      Department.all.should eq([hmrc])
    end
  end
  describe "#load_departments, #initialize" do
    it "should correctly create hmrc" do
      hmrc.id.should eq("hmrc")
      hmrc.title.should eq("HM Revenue & Customs")
      hmrc.format.should eq("Ministerial department")
      hmrc.slug.should eq("hm-revenue-customs")
      hmrc.abbreviation.should eq("HMRC")
    end
  end
  describe "#find" do
    it "should find hmrc by id" do
      Department.find("hmrc").should eq(hmrc)
    end
  end
  describe "#find_by" do
    it "title" do
      Department.find_by(title: "HM Revenue & Customs").should eq(hmrc)
    end
    it "incorrect title" do
      Department.find_by(title: "A").should be_nil
    end
    it "slug" do
      Department.find_by(slug: "hm-revenue-customs").should eq(hmrc)
    end
    it "incorrect slug" do
      Department.find_by(slug: "A").should be_nil
    end
    it "title and slug" do
      Department.find_by(title: "HM Revenue & Customs", slug: "hm-revenue-customs").should eq(hmrc)
    end
    it "incorrect title and slug" do
      Department.find_by(title: "A", slug: "hm-revenue-customs").should be_nil
    end
    it "title and incorrect slug" do
      Department.find_by(title: "HM Revenue & Customs", slug: "A").should be_nil
    end
  end
end
