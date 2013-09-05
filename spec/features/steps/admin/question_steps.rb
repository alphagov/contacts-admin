module Admin
  module QuestionSteps
    include ::CommonSteps

    def question_exists(question)
      ensure_on admin_questions_path

      has_selector?(questions_table_selector) &&
        within(questions_table_selector) do
          has_content? question.title
        end
    end

    def delete_question(question)
      ensure_on edit_admin_question_path(question)

      click_link 'Delete'
    end

    def update_question(question, new_details = {})
      ensure_on edit_admin_question_path(question)

      new_details.each do |field, value|
        fill_in "question_#{field}", with: value
      end

      yield if block_given?

      find('#question-submit').click
    end

    def create_question(details = {})
      ensure_on new_admin_question_path

      details.each do |field, value|
        fill_in "question_#{field}", with: value
      end

      yield if block_given?

      find('#question-submit').click
    end

    def question_updated(question, details = {})
      ensure_on edit_admin_question_path(question)

      details.all? { |field, value|
        has_field?("question_#{field}", with: value)
      }
    end

    def questions_table_selector
      "table.questions-table"
    end

    def associated_to_contact(question, contact)
      question.reload.contact == contact
    end
  end
end
