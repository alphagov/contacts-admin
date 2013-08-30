# coding: utf-8

class BreadcrumbList < Ariane::Render::HTMLList
  def list(crumbs)
    content_tag(:ul, class: options[:list_class]) do
      raw items(crumbs)
    end
  end

  def divider
    content_tag(:span, ' › ', class: 'divider')
  end
end