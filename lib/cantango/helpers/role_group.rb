module CanTango
  module Helpers
    module RoleGroup
      def has_role_group_meth
        config.role_groups.has_method
      end

      def role_groups_list_meth
        config.role_groups.list_method
      end

      def config
        CanTango.config
      end
    end
  end
end

