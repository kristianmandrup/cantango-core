module CanTango
  module Ability
    module Executor
      class Modes < Base
        def initialize candidate, options = {}
          raise "Candidate must be something!" if !candidate
          @candidate, @options = [candidate, options]
          calculate_modal_rules.normalize!
        end

        def rules
          @rules ||= []
        end

        def modal_rules mode
          mode?(mode) ? get_ability(mode).rules : []
        end

        protected

        def calculate_modal_rules
          @rules = modes.inject([]) do |result, mode|
            result = result + modal_rules(mode)
            result
          end
          self
        end

        def normalize!
          rules.flatten!
          rules.compact!
        end

        def ability_mode_executor_for mode
          ability_mode_executor_class_for(mode).new candidate, options
        end

        def ability_mode_executor_class_for mode
          "CanTango::Ability::Executor::#{mode.to_s.camelize}Mode".constantize
        end

        def mode? mode
          modes.include?(mode)
        end
        
        def modes
          @modes ||= options[:modes] || []
        end
      end
    end
  end
end