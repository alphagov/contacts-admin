class ContactGroupDecorator < Draper::Decorator
  delegate_all

  decorates_association :offices

  def to_s
    source.title
  end
end
