module CanTango::Ability::Executor
  class Base < CanTango::Ability::Base
    include CanTango::Ability::Executor
    include CanTango::Ability::Callbacks
    include CanTango::Ability::Builder

    attr_reader :ability, :modes, :options, :executed

    delegate :candidate,  :to => :ability

    def initialize ability, options = {}
      raise ArgumentError, "Ability must be something!" if !ability
      raise ArgumentError, "Ability must be a kind of CanTango::Ability::Base" if !ability.kind_of?(CanTango::Ability::Base)
      raise ArgumentError, "Options must be a hash" if !options.kind_of?(Hash)
      @ability = ability
      @options ||= options
    end

    def executed?
      @executed
    end
    
    def calc_rules
      super
    end
  end
end