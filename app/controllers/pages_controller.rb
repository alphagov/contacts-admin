class PagesController < ApplicationController
  def home
    @contact_group_form = ContactGroupForm.new
  end

  def search
  end
end
