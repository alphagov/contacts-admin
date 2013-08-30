class QuestionsDecorator < Draper::CollectionDecorator
  delegate :limit
end
