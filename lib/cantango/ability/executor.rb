module CanTango
  module Ability
    module Executor
      autoload_modules :Base, :Modal

      include CanTango::Helpers::Debug

      include CanTango::Ability::Rules
      include CanTango::Ability::Callbacks

      def self.included(base)
        base.send :include, CanTango::Helpers::Debug
        base.send :include, CanTango::Ability::Rules
        base.send :include, CanTango::Ability::Callbacks
      end

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