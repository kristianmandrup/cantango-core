module CanTango
  class Ability
    module Helper::Account
      def account
        return subject.active_account if subject.respond_to? :active_account
        subject
      end
    end
  end
end
