class ContactGroupDecorator < Draper::Decorator
  delegate_all

  decorates_association :contacts, scope: :by_title
  decorates_association :questions

  def to_s
    source.title
  end
end
