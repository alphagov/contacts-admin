class MoreInfoEmailAddress < MoreInfoRecord
  belongs_to :contact_record, inverse_of: :more_info_email_address
end
