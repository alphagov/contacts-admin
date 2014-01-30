class SearchController < ApplicationController
  expose(:department) {
    Department.find params[:department_id]
  }

  def index
    @search_form = SearchForm.new
    @contact_group_form = ContactGroupForm.new
    @contact_groups = department.contact_groups.decorate
  end

  def search
    @search_form = SearchForm.new(params[:search_form])
    @search_results = @search_form.results
  end

end
