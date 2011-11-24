module CanTango
  module Ability
    module Executor
      class NonCached < Base
        protected

        def start_execute
          debug "Executing non-cached Ability"
        end

        def end_execute
          debug "DONE"
        end
      end
    end
  end
end