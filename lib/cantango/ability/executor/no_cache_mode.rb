module CanTango
  module Ability
    module Executor
      class NoCacheMode < Base
        protected

        def start_execute
          debug "Executing Ability in :no_cache mode"
        end
      end
    end
  end
end