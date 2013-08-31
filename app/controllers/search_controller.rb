class SearchController < ApplicationController
  def search
    @search_form = SearchForm.new(params[:search_form])
  end
end
