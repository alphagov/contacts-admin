class ImportContacts
  class MoreInfoUrl
    include Virtus.value_object

    class MarkdownRenderer
      URL_PART         = %{[%<url_title>s](%<url>s)}.freeze
      DESCRIPTION_PART = %(%<url_description>s).freeze

      delegate :url, :description, :title, to: :@more_info_url

      def initialize(more_info_url)
        @more_info_url = more_info_url
      end

      def url_part
        if url.present? && title.present?
          sprintf(URL_PART, url:, url_title: title)
        end
      end

      def description_part
        sprintf(DESCRIPTION_PART, url_description: description)
      end

      def render
        [url_part, description_part].compact.join("\n")
      end
    end

    attribute :url, String
    attribute :title, String
    attribute :description, String

    def to_markdown
      MarkdownRenderer.new(self).render
    end
  end
end
