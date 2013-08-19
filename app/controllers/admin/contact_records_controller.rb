module Admin
  class ContactRecordsController < AdminController
    def index
      @contact_records = ContactRecord.includes(:contacts).all
    end
  end
end
