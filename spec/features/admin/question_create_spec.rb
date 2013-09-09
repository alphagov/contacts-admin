require 'spec_helper'

describe 'Question creation', auth: :user do
  include Admin::QuestionSteps

  let!(:contact) { create :contact }
  let(:question) { build :question }

  before {
    verify !question_exists(question)
  }

  specify 'it can be created' do
    pending "changing css visibility"
    create_question({
      title: question.title
    }) do
      select contact, from: 'question_contact_id'
    end

    verify question_exists(question)
    verify associated_to_contact(Question.first, contact)
  end
end
