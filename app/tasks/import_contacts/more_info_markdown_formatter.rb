class ImportContacts
  class MoreInfoMarkdownFormatter
    TEMPLATE = %Q{[%{url}](%{url_title})
      %{url_description}

      %{content}}

    delegate :url, :title, :description, to: :@more_info_url
    delegate :content, to: :@more_info_record

    def initialize(more_info_record)
      @more_info_record = more_info_record
      @more_info_url = more_info_record.more_info_url
    end

    def format
      TEMPLATE % template_payload
    end

    private

    def template_payload
      {
        url: url,
        url_title: title,
        url_description: description,
        content: content
      }
    end
  end
end
