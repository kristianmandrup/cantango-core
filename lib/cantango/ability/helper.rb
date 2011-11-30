module CanTango
  module Ability
    module Helper
      def self.modules
        [:Account, :Engine, :User]
      end
      
      autoload_modules *modules
    end
  end
end
