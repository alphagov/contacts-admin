module ApplicationHelper
  def page_title(*title_parts)
    if title_parts.any?
      title_parts.push("Admin") if params[:controller] =~ /^admin\//
      title_parts.push("GOV.UK")
      @page_title = title_parts.reject { |p| p.blank? }.join(" - ")
    else
      @page_title
    end
  end

  def meta_description_tag
    tag :meta, name: "description", content: @meta_description
  end

  def page_class(css_class)
    content_for(:page_class, css_class)
  end

  def govspeak(text)
    Govspeak::Document.new(text).to_sanitized_html.html_safe if text
  end

  def formatting_help_link(show_section = "")
    "<a href='#formatting#{show_section if show_section.present?}' role='button' data-toggle='modal'>formatting help</a>".html_safe
  end
end
