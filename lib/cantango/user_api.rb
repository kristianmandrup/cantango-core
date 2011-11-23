module CanTango
  module UserApi
    attr_writer :active_user, :active_account, :ability_class

    def self.included(base)
      CanTango.config.users.register base
    end

    def active_user
      @active_user || self
    end

    def active_account
      return @active_account if  @active_account
      return send(:account) if respond_to? :account
      raise "No account could be found for user: #{self}"
    end

    def can? *args
      ability.can?(*args)
    end

    def cannot? *args
      ability.cannot?(*args)
    end

    protected
    
    def ability
      ability_class.new(active_user)
    end
    
    def ability_class
      CanTango::Ability::Executor::Modes
    end
  end
end