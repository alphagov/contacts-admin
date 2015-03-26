require "spec_helper"

describe ContactFormLinksPresenter do
  let(:form_link) { create(:contact_form_link, title: "Abc", description: "* xyz") }

  it "transforms a contact form link to the correct format" do
    presented = ContactFormLinksPresenter.new([form_link]).present.first

    expect(presented[:title]).to eq("Abc")
    actual_presented_description_text = Nokogiri(presented[:description]).at_css("ul li").text
    expect(actual_presented_description_text).to eq("xyz")
  end
end
