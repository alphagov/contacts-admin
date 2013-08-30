require 'spec_helper'

describe 'Question editing', auth: :user do
  include Admin::QuestionSteps

  let!(:question)   { create :question }
  let!(:new_office) { create :office }

  before { verify question_exists(question) }

  specify 'it can be updated' do
    update_question(question, title: 'new title') do
      select new_office, from: 'question_office_id'
    end

    verify question_updated(question, title: 'new title')
    verify associated_to_office(question, new_office)
  end
end
