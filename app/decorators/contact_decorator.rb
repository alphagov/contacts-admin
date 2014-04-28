class ContactDecorator < Draper::Decorator
  delegate_all

  def to_s
    source.title
  end

  def to_param
    slug
  end

  def quick_links
    links = [
      OpenStruct.new(title: quick_link_title_1, url: quick_link_1),
      OpenStruct.new(title: quick_link_title_2, url: quick_link_2),
      OpenStruct.new(title: quick_link_title_3, url: quick_link_3),
    ]
    links.reject { |link| link.title.blank? || link.url.blank? }
  end
end
