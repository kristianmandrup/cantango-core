module CanTango
  module Ability
    module Executor
      autoload_modules :Base, :Modal

      include CanTango::Ability::Rules
      include CanTango::Ability::Callbacks
      
      def execute
        within_callbacks do
          clear_rules!
          calculate_rules
        end
      end
    end
  end
end