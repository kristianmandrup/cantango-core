module CanTango::Ability::Helper
  module User
    def user
      return subject.user if subject.respond_to? :user
      subject
    end

    def key_method
      key_field = CanTango.config.user.unique_key_field
      raise "\nModel <#{user.class}> has no ##{key_field} as defined in CanTango.config.user.unique_key_field" if !user.respond_to?(key_field)
      key_field
    end
  end
end
