module CanTango
  module Ability
    module Helper
      def self.modules
        [:Account, :Cache, :Engine, :Masquerade, :Permit, :PermitStore, :Role, :RoleGroup, :User]
      end
      
      autoload_modules *modules
    end
  end
end
