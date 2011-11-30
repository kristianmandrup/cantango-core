module CanTango::Ability::Helper
  module Account
    def account
      return subject.active_account if subject.respond_to? :active_account
      return subject.account if subject.respond_to? :account
      subject
    end
  end
end
