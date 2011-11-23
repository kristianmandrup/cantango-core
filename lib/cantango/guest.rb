require 'active_model'

module CanTango
  module Guest
    def self.included(base)
      base.extend  ::ActiveModel::Naming
      base.send :include, ::ActiveModel::Conversion
      base.send :include, ::ActiveModel::Validations
    end

    def email
      'guest@info.com'
    end

    def has_role? role
      role.to_sym == :guest
    end

    def persisted?
      false
    end
  end
end