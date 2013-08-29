module HmrcContacts
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

      def let(name, &block)
        define_method(name, &block)
      end
    end
  end
end
