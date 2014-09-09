require "spec_helper"

describe ContactFormLinksPresenter do
  let(:form_link) { create :contact_form_link }

  it "transforms a contact form link to the correct format" do
    presented = ContactFormLinksPresenter.new([form_link]).present.first

    expect(presented[:title]).to eq(form_link.title)

    govspeak_description = "<ul>\n<li>#{form_link.description.sub("\* ", "")}</li>\n</ul>"
    expect(presented[:description]).to eq(govspeak_description)
  end
end
