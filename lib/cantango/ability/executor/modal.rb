module CanTango::Ability::Executor
  class Modal < Base    
    def initialize candidate, modes, options = {}
      super candidate, options
      modes = [modes].flatten if modes
      raise ArgumentError, "Modes must be a list of modes to execute!" if modes.blank?
      @modes = modes
      execute
    end

    def calculate_rules
      @rules = modes.inject([]) do |result, mode|
        result = result + modal_rules(mode)
        result
      end
      normalize_rules!
    end

    def execute
      return if executed?
      clear_rules!
      calculate_rules
    rescue Exception => e
      debug e.message      
    ensure
      @executed = true
      rules
    end

    def finder
      @finder ||= CanTango::Ability::Mode::Finder.new self
    end

    protected

    def modal_rules mode
      mode?(mode) ? executor(mode).execute : []
    end

    def executor mode
      @executor ||= finder.executor_for(mode)
    end

    def mode? mode
      modes.include?(mode)
    end
  end
end
