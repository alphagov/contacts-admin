require 'spec_helper'

describe 'Question editing', auth: :user do
  include Admin::QuestionSteps

  let!(:question)    { create :question }
  let!(:new_contact) { create :contact }

  before { verify question_exists(question) }

  specify 'it can be updated' do
    pending "changing css visibility"
    update_question(question, title: 'new title') do
      select new_contact, from: 'question_contact_id'
    end

    verify question_updated(question, title: 'new title')
    verify associated_to_contact(question, new_contact)
  end
end
