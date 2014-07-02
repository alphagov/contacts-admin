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
    if text
      content_tag(:div, Govspeak::Document.new(text).to_sanitized_html.html_safe, class: "govspeak")
    end
  end

  def formatting_help_link(show_section = "")
    "<a href='#formatting#{show_section if show_section.present?}' role='button' data-toggle='modal'>formatting help</a>".html_safe
  end

  # This hackery is necessary while we're supporting both the new and the legacy routes.
  # We want the legacy index page to link to the legacy show URL, while the new index
  # page should link to the new show URL
  def calculate_contact_path(org, contact)
    if request.path == legacy_contacts_path(org)
      legacy_contact_path(org, contact)
    else
      contact_path(org, contact)
    end
  end
end
