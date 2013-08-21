class MoreInfoNumber < MoreInfoRecord
  belongs_to :contact_record, inverse_of: :more_info_number
end
