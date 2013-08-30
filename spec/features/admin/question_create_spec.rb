require 'spec_helper'

describe 'Question creation', auth: :user do
  include Admin::QuestionSteps

  let!(:office)   { create :office }
  let(:question)  { build :question }

  before {
    verify !question_exists(question)
  }

  specify 'it can be created' do
    create_question({
      title: question.title
    }) do
      select office, from: 'question_office_id'
    end

    verify question_exists(question)
    verify associated_to_office(Question.first, office)
  end
end
