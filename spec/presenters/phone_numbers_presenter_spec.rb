require "spec_helper"

describe PhoneNumbersPresenter do
  let(:phone) { create :phone_number,
                       description: "email description",
                       open_hours: "line open hours",
                       best_time_to_call: "best time to call"
              }

  it "transforms a contact to the correct format" do
    presented = PhoneNumbersPresenter.new([phone]).present.first

    presented[:title].should eq(phone.title)
    presented[:number].should eq(phone.number)

    govspeak_description = "<p>#{phone.description}</p>"
    presented[:description].should eq(govspeak_description)

    govspeak_open_hours = "<p>#{phone.open_hours}</p>"
    presented[:open_hours].should eq(govspeak_open_hours)

    govspeak_best_time = "<p>#{phone.best_time_to_call}</p>"
    presented[:best_time_to_call].should eq(govspeak_best_time)
  end
end
