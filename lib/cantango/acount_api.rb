module CanTango
  module AccountApi
    attr_writer :active_user, :active_account, :ability_class

    def self.included(base)
      CanTango.config.users.register base
    end

    def active_user
      return @active_user if  @active_user
      return send(:user) if respond_to? :user
      raise "No user could be found for account: #{self}"
    end

    def active_account
      @active_account || self
    end

    def can? *args
      ability.can?(*args)
    end

    def cannot? *args
      ability.cannot?(*args)
    end

    protected
    
    def ability
      ability_class.new(active_account)
    end
    
    def ability_class
      CanTango::Ability::Executor::Modes
    end
  end
end