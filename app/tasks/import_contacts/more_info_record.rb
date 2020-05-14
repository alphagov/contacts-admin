class ImportContacts
  class MoreInfoRecord
    include Virtus.value_object

    class MarkdownRenderer
      CONTENT_PART = %(%<content>s).freeze

      delegate :content, to: :@more_info_record

      def initialize(more_info_record)
        @more_info_record = more_info_record
      end

      def render
        sprintf(CONTENT_PART, content: content)
      end
    end

    class NullMoreInfoUrl
      def to_markdown; end
    end

    attribute :content, String
    attribute :more_info_url, MoreInfoUrl

    def to_markdown
      markdown_parts.compact.join("\n")
    end

    def more_info_url
      super.presence || NullMoreInfoUrl.new
    end

  private

    def markdown_parts
      [more_info_url.to_markdown, MarkdownRenderer.new(self).render]
    end
  end
end
