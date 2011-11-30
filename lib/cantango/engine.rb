module CanTango
  class Engine
    include CanTango::Helpers::Debug

    attr_reader :ability, :options

    delegate :session, :user, :subject, :candidate, :cached?, :to => :ability

    def initialize ability, options = {}
      @ability, @options = [ability, options]
    end

    def execute!
      raise NotImplementedError
    end

    def engine_name
      raise NotImplementedError
    end

    def valid_mode? mode
      modes.include? mode.to_sym
    end

    def modes
      @modes ||= options[:modes] || []
    end
  end
end
