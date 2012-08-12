require 'cancan'
require 'cancan/rule'

module CanTango
  module CanCan
    module RuleClass
      # CanCan 1.5+
      def rule_class
        CanCan::CanDefinition
      end
    end
  end
end
