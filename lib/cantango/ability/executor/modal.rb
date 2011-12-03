module CanTango::Ability::Executor
  class Modal < Base

    def initialize candidate, modes, options = {}
      raise ArgumentError, "Candidate must be something!" if !candidate
      raise ArgumentError, "Modes must be a list of modes to execute!" if modes.blank?

      @candidate, @modes, @options = [candidate, modes, options]
      execute!
    end

    def calculate_rules
      @rules = modes.inject([]) do |result, mode|
        result = result + modal_rules(mode)
        result
      end
      normalize_rules!
    end

    def finder
      @finder ||= CanTango::Ability::Mode::Finder.new
    end

    protected

    def modal_rules mode
      mode?(mode) ? executor_for(mode).execute! : []
    end

    def mode? mode
      modes.include?(mode)
    end
  end
end
