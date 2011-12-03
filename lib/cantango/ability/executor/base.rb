module CanTango
  module Ability
    module Executor
      class Base
        include CanTango::Ability::Executor

        attr_reader :candidate, :modes, :options

        def initialize candidate, options = {}
          raise ArgumentError, "Candidate must be something!" if !candidate
          @candidate, @options = [candidate, options]
        end

        def rules
          raise NotImplementedError
        end
        
        def calculate_rules
            raise NotImplementedError
          end

        def self.inherited(base)
          base.send :include, CanTango::Helpers::Debug
        end
      end
    end
  end
end