module CanTango::Ability::Executor
  class Base < CanTango::Ability::Base
    include CanTango::Ability::Executor
    include CanTango::Ability::Callbacks

    attr_reader :candidate, :modes, :options, :executed

    def initialize candidate, options = {}
      raise ArgumentError, "Candidate must be something!" if !candidate
      @candidate, @options = [candidate, options]
    end

    def executed?
      @executed
    end
    
    def calculate_rules
      super
    end

    def self.inherited(base)
      base.send :include, CanTango::Helpers::Debug
      base.send :include, CanTango::Ability::Executor
      base.send :include, CanTango::Ability::Rules
      base.send :include, CanTango::Ability::Callbacks
    end
  end
end