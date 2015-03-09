require 'json-schema'

class GovukContentSchema

  class ImproperlyConfiguredError < RuntimeError; end

  def self.schema_path(schema_name)
    Rails.root.join("#{self.govuk_content_schemas_path}/formats/#{schema_name}/publisher/schema.json").to_s
  end

  def self.govuk_content_schemas_path
    ENV['GOVUK_CONTENT_SCHEMAS_PATH'] || '../govuk-content-schemas'
  end

  class Validator
    def initialize(schema_name, document)
      @schema_path = GovukContentSchema.schema_path(schema_name)
      if !Pathname(GovukContentSchema.govuk_content_schemas_path).exist?
        message = "Dependency govuk-content-schemas cannot be found at: #{GovukContentSchema.govuk_content_schemas_path}."
        message += " Clone it to that directory, or set GOVUK_CONTENT_SCHEMAS_PATH (see README.md for details)."
        raise ImproperlyConfiguredError, message
      elsif !File.exists?(@schema_path)
        raise ImproperlyConfiguredError, "Schema file not found: #{@schema_path}."
      end
      @document = document
    end

    def valid?
      errors.empty?
    end

    def errors
      @errors ||= JSON::Validator.fully_validate(@schema_path, @document)
    end
  end
end


module GovukContentSchemaHelpers
  def assert_valid_against_schema(content_item_hash, format)
    validator = GovukContentSchema::Validator.new(format, content_item_hash.to_json)
    assert validator.valid?, "JSON not valid against #{format} schema: #{validator.errors.to_s}"
  end
end
