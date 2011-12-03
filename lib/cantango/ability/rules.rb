module CanTango::Ability
  module Rules
    def calculate_rules
      rules
    end

    def normalize_rules!
      rules.flatten!
      rules.compact!
    end

    def rules
      @rules ||= []
    end

    def clear_rules!
      rules = default_rules
    end

    def default_rules
      []
    end
  end
end