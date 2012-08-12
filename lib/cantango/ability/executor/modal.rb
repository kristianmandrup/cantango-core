module CanTango::Ability::Executor
  class Modal < Base   
    sweetload :Extractor

    attr_writer :finder, :extractor

    def initialize ability, modes, options = {}
      super ability, options
      @modes = extractor(modes, options).extract

      @finder     = options[:finder] if options[:finder]
      @extractor  = options[:extractor] if options[:extractor]

      execute
    end
    
    def self.build candidate, modes, options = {}
      new build_ability(candidate, options), modes, options
    end

    def calc_rules
      @rules = modes.inject([]) do |result, mode|
        result = result + modal_rules(mode)
        result
      end
      # see CanTango::Ability::Rules
      normalize_rules!
    end

    def finder
      @finder ||= CanTango::Ability::Mode::Finder.new self
    end

    def extractor
      @extractor ||= CanTango::Ability::Mode::Extractor.new self
    end

    def executor mode
      @executor ||= finder.executor_for(mode)
    end

    protected

    def modal_rules mode
      mode?(mode) ? executor(mode).execute : []
    end

    def mode? mode
      modes.include?(mode)
    end
  end
end
