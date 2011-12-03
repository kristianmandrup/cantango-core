module CanTango::Ability::Executor
  class Base
    include CanTango::Ability::Executor
    include CanTango::Ability::Callbacks

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
      base.send :include, CanTango::Ability::Executor
      base.send :include, CanTango::Ability::Rules
      base.send :include, CanTango::Ability::Callbacks
    end
  end
end