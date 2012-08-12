module CanTango
  module Ability
    module Helper
      def self.modules
        [:Account, :Engine, :User]
      end
      
      sweetload *modules
    end
  end
end
