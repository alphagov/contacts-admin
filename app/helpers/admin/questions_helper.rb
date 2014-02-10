module Admin
  module QuestionsHelper
    def contacts_by_department
      Department.all.map { |department| [department, department.contacts] }
    end
  end
end
