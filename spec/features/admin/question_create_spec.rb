require 'spec_helper'

describe 'Question creation', auth: :user do
  include Admin::QuestionSteps

  let!(:contact) { create :contact }
  let!(:contact_group) { create :contact_group }
  let(:question) { build :question }

  before {
    verify !question_exists(question)
  }

  specify 'it can be created' do
    create_question({
      title: question.title
    }) do
      select contact, from: 'question_contact_id'
      select contact_group, from: 'question_contact_group_id'
    end

    verify question_exists(question)
    verify associated_to_contact(Question.first, contact)
  end
end
