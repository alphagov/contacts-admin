class ContactGroupsController < ApplicationController
  expose(:contact_groups) {
    ContactGroup.with_offices.except_most_popular.by_title
  }
  expose(:most_popular_contact_groups) {
    ContactGroup.most_popular.with_offices.by_title
  }

  def index
  end
end
