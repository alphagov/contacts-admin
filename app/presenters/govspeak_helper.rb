module GovspeakHelper
  def govspeak(text)
    if text
      Govspeak::Document.new(text).to_sanitized_html
    end
  end
end
