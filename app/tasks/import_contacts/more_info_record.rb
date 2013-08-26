class ImportContacts
  class MoreInfoRecord
    include Virtus::ValueObject

    attribute :content, String
    attribute :more_info_url, MoreInfoUrl

    def to_markdown
      ImportContacts::MoreInfoMarkdownFormatter.new(self).format
    end
  end
end
