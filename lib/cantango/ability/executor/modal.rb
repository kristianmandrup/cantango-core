module CanTango::Ability::Executor
  class Modal < Base
    def initialize candidate, modes, options = {}
      super
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
