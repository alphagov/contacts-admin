class SearchController < ApplicationController
  def search
    @search_form = SearchForm.new(params[:search_form])
    @search_results = @search_form.results
  end
end
