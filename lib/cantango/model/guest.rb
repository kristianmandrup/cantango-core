require 'active_model'

module CanTango
  module Model
    module Guest
      def self.included(base)
        base.extend  ::ActiveModel::Naming
        base.extend  ::ActiveModel::Callbacks

        base.send :include, ::ActiveModel::Conversion
        base.send :include, ::ActiveModel::Validations
      end

      def email
        'guest@example.com'
      end

      def has_role? role
        role.to_sym == :guest
      end

      def persisted?
        false
      end
    end
  end
end