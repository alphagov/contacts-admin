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
    tag :meta, name: 'description', content: @meta_description
  end

  def page_class(css_class)
    content_for(:page_class, css_class)
  end

  def markdown(markdown_text, renderer = markdown_renderer)
    renderer.render(markdown_text).html_safe
  end

  private

  def markdown_renderer
    @markdown_renderer ||= Redcarpet::Markdown.new(Redcarpet::Render::XHTML.new(filter_html: true),
                                                   autolink: true,
                                                   space_after_headers: true,
                                                   tables: true,
                                                   superscript: true)
  end
end
