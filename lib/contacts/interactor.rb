module Contacts
  module Interactor
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def takes(*args)
        define_initialize(args)
      end

      def define_initialize(args)
        assignments = args.map { |a| "@#{a} = #{a}" }.join("\n")

        class_eval %{
          def initialize(#{args.join(", ")})
                         #{assignments}
          end
        }
      end
    end
  end
end
