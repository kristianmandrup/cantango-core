module CanTango::Ability::Mode
  class Finder
    attr_reader :candidate, :ability, :options

    def initialize candidate, ability, options = {}
      @candidate, @ability, @options = [candidate, ability, options]
    end

    def executor_for mode
      class_for(mode).new ability, options
    end

    def class_for mode
      "CanTango::Ability::Mode::#{mode.to_s.camelize}".constantize
    end
  end
end
