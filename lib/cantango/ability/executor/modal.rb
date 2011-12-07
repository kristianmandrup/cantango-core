module CanTango::Ability::Executor
  class Modal < Base    
    def initialize ability, modes, options = {}
      super ability, options
      extract_modes modes
      execute
    end

    module ClassMethods
      def build candidate, modes, options = {}
        new build_ability(candidate, options), modes, options
      end
    end
    extend ClassMethods

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

    def extract_modes modes
      raise ArgumentError, "Modes must defined!" if !modes
      modes = modes.kind_of?(Hash) ? modes_from_option(modes) : modes
      modes = [modes].flatten
      raise ArgumentError, "Modes must be a list of modes to execute!" if modes.blank?
      @modes = modes
    end
    
    def modes_from_option options
      @options.merge! options
      options[:modes] || options[:mode]
    end

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
