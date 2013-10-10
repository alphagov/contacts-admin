module Admin
  class QuestionsController < AdminController
    expose(:questions) { Question.includes(:contact) }
    expose(:question, attributes: :question_params)

    def index
      @contact_groups = ContactGroup.all
    end

    def new
      question.contact_group_id = params[:contact_group_id]
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

      redirect_to admin_questions_path, notice: 'Question was successfully deleted'
    end

    private

    def question_params
      params.require(:question).permit(
        :contact_id,
        :title,
        :contact_group_id
      )
    end
  end
end
