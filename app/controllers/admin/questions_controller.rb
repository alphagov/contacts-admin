module Admin
  class QuestionsController < AdminController
    expose(:questions) { Question.includes(:office) }
    expose(:question, attributes: :question_params)

    def index
    end

    def edit
    end

    def new
    end

    def update
      if question.update_attributes(question_params)
        redirect_to admin_questions_path, notice: 'Question was successfully updated'
      else
        render :edit
      end
    end

    def create
      if question.save
        redirect_to admin_questions_path, notice: 'Question was successfully created'
      else
        render :new
      end
    end

    def destroy
      question.destroy

      redirect_to admin_questions_path, notice: 'Question was successfully removed'
    end

    private

    def question_params
      params.require(:question).permit(
        :office_id,
        :title
      )
    end
  end
end
