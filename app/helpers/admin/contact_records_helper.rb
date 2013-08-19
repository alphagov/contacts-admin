module Admin
  module ContactRecordsHelper
    def render_contact_keywords(keywords = [])
      keywords.select(&:present?).map { |keyword|
        content_tag(:span, keyword, class: 'label label-info')
      }.join("\n").html_safe
    end
  end
end
