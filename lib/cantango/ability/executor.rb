module CanTango
  module Ability
    module Executor
      autoload_modules :Base, :NoCacheMode, :Modes
      
      def execute!
        within_callbacks do
          clear_rules!
          calculate_rules
        end
      end

      def calculate_rules
        raise NotImplementedError
      end
    end
  end
end