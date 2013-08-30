class QuestionDecorator < Draper::Decorator
  delegate_all

  decorates_association :office

  def to_s
    source.title
  end
end
