module ApplicationHelper
  def page_title(*title_parts)
    title_parts.push("Admin") if params[:controller] =~ /^admin\//
    title_parts.push("GOV.UK")
    title_parts.reject(&:blank?).join(" - ")
  end

  def page_class(css_class)
    content_for(:page_class, css_class)
  end

  def govspeak(text)
    if text
      content_tag(:div, Govspeak::Document.new(text).to_html.html_safe, class: "govspeak")
    end
  end

  def formatting_help_link
    "<a href='#formatting' role='button' data-toggle='modal' class='if-no-js-hide'>Formatting help</a>".html_safe
  end
end
