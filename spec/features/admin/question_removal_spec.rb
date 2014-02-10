require "spec_helper"

describe "Question removal", auth: :user do
  include Admin::QuestionSteps

  let!(:question) { create :question }

  before { verify question_exists(question) }

  specify "it can be removed" do
    pending("deprecated")
    delete_question(question)

    verify !question_exists(question)
  end
end
