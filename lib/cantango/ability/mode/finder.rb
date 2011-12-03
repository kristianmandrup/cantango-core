module CanTango::Ability::Mode
  class Finder
    attr_reader :executor

    delegate :candidate, :options, :to => :executor

    def initialize executor
      @executor = executor
    end

    def executor_for mode
      class_for(mode).new candidate, options
    end

    def class_for mode
      "CanTango::Ability::Mode::#{mode.to_s.camelize}".constantize
    end
  end
end
