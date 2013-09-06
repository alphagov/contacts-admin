class PagesController < ApplicationController
  expose(:department) {
    Department.find_by_slug!(params[:department_id])
  }

  def home
    @search_form = SearchForm.new
    @contact_group_form = ContactGroupForm.new
    @contact_groups = department.contact_groups.decorate
  end

  def hmrc
    redirect_to "/hmrc/contact_us"
  end
end
