class PagesController < ApplicationController
  def home
    @search_form = SearchForm.new
    @contact_group_form = ContactGroupForm.new
    @contact_groups = ContactGroup.decorate
  end

  def search
  end
end
