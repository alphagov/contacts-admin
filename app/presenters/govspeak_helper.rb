module GovspeakHelper
  def govspeak(text)
    Govspeak::Document.new(text).to_sanitized_html if text
  end
end
