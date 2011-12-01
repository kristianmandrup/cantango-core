module CanTango
  module Ability
    module Executor
      class Base
        include CanTango::Helpers::Debug

        # FIX - where is the ability???

        delegate :session, :user, :subject, :candidate, :cached?, :can?, :cannot?, :to => :ability

        def execute!
          return if !valid?
          start_execute
          return if cached? # rule set already loaded

          clear_rules!
          permit_rules

          end_execute
          rules # return rule set
        end

        def rules
          @rules ||= []
        end

        def clear_rules!
          @rules ||= []
        end

        def permit_rules
          raise NotImplementedError
        end

        def cached?
          false
        end

        protected

        def start_execute
          debug "Executing base Ability"
        end

        def end_execute
          debug "DONE"
        end

        def key_method_names
          []
        end
      end
    end
  end
end