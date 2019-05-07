require "rails_helper"

describe PhoneNumbersPresenter do
  let(:phone) do
    create(:phone_number,
           description: "email description",
           open_hours: "line open hours",
           best_time_to_call: "best time to call")
  end

  it "transforms a contact to the correct format" do
    presented = PhoneNumbersPresenter.new([phone]).present.first

    expect(presented[:title]).to eq(phone.title)
    expect(presented[:number]).to eq(phone.number)

    govspeak_description = "<p>#{phone.description}</p>"
    expect(presented[:description].strip).to eq(govspeak_description)

    govspeak_open_hours = "<p>#{phone.open_hours}</p>"
    expect(presented[:open_hours].strip).to eq(govspeak_open_hours)

    govspeak_best_time = "<p>#{phone.best_time_to_call}</p>"
    expect(presented[:best_time_to_call].strip).to eq(govspeak_best_time)
  end
end
