module CanTango
  module Ability
    module Executor
      sweetload :Base, :Modal

      include CanTango::Helpers::Debug
      include CanTango::Ability::Rules
      include CanTango::Ability::Callbacks

      # the way to abort execution is to raise an exception!
      def execute
        within_callbacks do
          clear_rules!
          calculate_rules
        end
      rescue Exception => e
        debug e.message
      ensure
        @executed = true
        rules
      end
    end
  end
end