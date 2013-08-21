class MoreInfoPostAddress < MoreInfoRecord
  belongs_to :contact_record, inverse_of: :more_info_post_address
end
