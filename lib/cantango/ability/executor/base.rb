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

    # def self.inherited(base)
    #   base.send :include, CanTango::Helpers::Debug
    #   base.send :include, CanTango::Ability::Executor
    #   base.send :include, CanTango::Ability::Rules
    #   base.send :include, CanTango::Ability::Callbacks
    # end

    def executed?
      @executed
    end
    
    def calculate_rules
      super
    end
  end
end