module CanTango::Ability::Executor
  class Base < CanTango::Ability::Base
    include CanTango::Ability::Executor
    include CanTango::Ability::Callbacks

    attr_reader :ability, :modes, :options, :executed

    delegate :candidate,  :to => :ability

    def initialize ability, options = {}
      raise ArgumentError, "Ability must be something!" if !ability
      raise ArgumentError, "Ability must be a kind of CanTango::Ability::Base" if !ability.kind_of?(CanTango::Ability::Base)
      raise ArgumentError, "Options must be a hash" if !options.kind_of?(Hash)
      @ability = ability
      @options ||= options
    end

    module ClassMethods
      def build candidate, options = {}
        self.new build_ability(candidate, options), options
      end

      def inherited(base)
        base.send :include, CanTango::Helpers::Debug
        base.send :include, CanTango::Ability::Executor
        base.send :include, CanTango::Ability::Rules
        base.send :include, CanTango::Ability::Callbacks
      end

      protected

      def build_ability candidate, options = {}
        CanTango::Ability::Base.new(candidate, options = {})
      end
    end
    extend ClassMethods

    def executed?
      @executed
    end
    
    def calculate_rules
      super
    end
  end
end