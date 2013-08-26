class ImportContacts
  class MoreInfoUrl
    include Virtus::ValueObject

    attribute :url, String
    attribute :title, String
    attribute :description, String
  end
end
