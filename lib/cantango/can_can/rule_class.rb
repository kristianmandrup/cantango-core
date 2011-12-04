require 'cancan'
require 'cancan/rule'

module CanTango
  module CanCan
    module RuleClass
      # CanCan 1.5 compatibility
      def rule_class
        return ::CanCan::Rule if defined? ::CanCan::Rule
        return ::CanCan::CanDefinition if defined? ::CanCan::CanDefinition
        raise "CanCan has changed the Rule class and CanTango is not yet compatible with this change!"
      end
    end
  end
end
