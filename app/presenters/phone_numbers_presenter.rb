class PhoneNumbersPresenter
  include GovspeakHelper

  def initialize(phone_numbers)
    @phone_numbers = phone_numbers
  end

  def present
    @phone_numbers.map do |phone|
      {
        title: phone.title,
        number: phone.number,
        textphone: phone.textphone,
        international_phone: phone.international_phone,
        fax: phone.fax,
        description: govspeak(phone.description),
        open_hours: govspeak(phone.open_hours),
        best_time_to_call: govspeak(phone.best_time_to_call),
      }
    end
  end
end
