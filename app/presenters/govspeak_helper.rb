module GovspeakHelper
  def govspeak(text)
    Govspeak::Document.new(text).to_html if text
  end
end
