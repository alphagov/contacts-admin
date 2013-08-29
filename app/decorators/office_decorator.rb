class OfficeDecorator < Draper::Decorator
  delegate_all

  def to_s
    source.title
  end

  def to_param
    slug
  end
end
