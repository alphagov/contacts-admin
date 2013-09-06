class QuestionDecorator < Draper::Decorator
  delegate_all

  decorates_association :contact

  def to_s
    source.title
  end
end
