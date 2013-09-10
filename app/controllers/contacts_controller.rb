class ContactsController < ApplicationController
  expose(:department) {
    Department.find_by!(slug: params[:department_id])
  }

  expose(:contact) {
    department.contacts.find_by!(slug: params[:id]).decorate
  }

  expose(:most_popular_contact_groups) {
    department.
    contact_groups.
    most_popular.
    with_contacts.
    merge(Contact.for_listing).
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
    merge(Contact.for_listing).
    decorate
  }

  def index
  end

  def show
  end

  def information_you_will_need
  end

  def contact_details
  end
end
