class ContactGroupsController < ApplicationController
  expose(:department) {
    Department.find_by_slug!(params[:department_id])
  }
  expose(:most_popular_contact_groups) {
    department.
    contact_groups.
    most_popular.
    with_contacts.
    by_title.
    decorate
  }
  expose(:ungrouped_contacts) {
    department.
    contacts.
    ungrouped.
    for_listing.
    decorate
  }
  expose(:contact_groups) {
    department.
    contact_groups.
    with_contacts.
    except_most_popular.
    by_title.
    decorate
  }

  def index
  end
end
