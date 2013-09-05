module Admin
  class QuestionsController < AdminController
    expose(:questions) { Question.includes(:contact) }
    expose(:question, attributes: :question_params)

    before_filter :set_ariane

    def index
      @contact_groups = ContactGroup.all
    end

    def edit
      ariane.add "Editing #{question.title}"
    end

    def new
      ariane.add 'New Question'
    end

    def update
      ariane.add "Editing #{question.title}"

      if question.update_attributes(question_params)
        redirect_to admin_questions_path, notice: 'Question was successfully updated'
      else
        render :edit
      end
    end

    def create
      ariane.add 'New Question'

      if question.save
        redirect_to admin_questions_path, notice: 'Question was successfully created'
      else
        render :new
      end
    end

    def destroy
      question.destroy

      redirect_to admin_questions_path, notice: 'Question was successfully deleted'
    end

    private

    def question_params
      params.require(:question).permit(
        :contact_id,
        :title
      )
    end

    def set_ariane
      ariane.add 'Questions', admin_questions_path
    end
  end
end
