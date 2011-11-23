module CanTango
  module Helpers
    module Role
      def has_role_meth
        config.roles.has_method
      end

      def roles_list_meth
        config.roles.list_method
      end

      def config
        CanTango.config
      end
    end
  end
end

