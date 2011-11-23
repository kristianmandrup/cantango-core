module CanTango::Macros
  module Account
    def tango_user_account options = {}
      self.send :include, CanTango::AccountApi
      
      if defined? CanTango::Macros::Masquerader
        self.send :include, CanTango::Macros::Masquerader
        masquerader if options[:masquerade]
      end
    end
    alias_method :tango_account, :tango_user_account
    alias_method :cantango_account, :tango_user_account
  end  
end