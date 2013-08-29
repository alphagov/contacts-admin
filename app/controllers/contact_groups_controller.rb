class ContactGroupsController < ApplicationController
  expose(:contact_groups) {
    ContactGroup.with_offices
  }
  expose(:most_popular_contact_groups) {
    ContactGroup.most_popular.with_offices
  }

  def index
  end
end
