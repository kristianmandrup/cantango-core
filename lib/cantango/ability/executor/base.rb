module CanTango
  module Ability
    module Executor
      class Base
        include CanTango::Ability::Executor
        
        def initialize candidate, modes, options = {}
          raise ArgumentError, "Candidate must be something!" if !candidate
          raise ArgumentError, "Modes must be a list of modes to execute!" if modes.blank?

          @candidate, @modes, @options = [candidate, modes, options]
          execute
        end
      end
    end
  end
end