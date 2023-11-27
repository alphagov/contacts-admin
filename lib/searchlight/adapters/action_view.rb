module Searchlight
  module Adapters
    module ActionView
      extend ActiveSupport::Concern
      include ActiveModel::Conversion

      def self.included(search_class)
        search_class.extend ActiveModel::Naming
      end

      def persisted?
        false
      end
    end
  end
end
