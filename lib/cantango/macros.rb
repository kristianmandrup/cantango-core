module CanTango
  module Macros
    autoload_modules :User, :UserAccount
  end
end

module Module
  [:User, :UserAccount].each do |macro|
    self.send :include, "CanTango::Macros::#{macro.to_s.camelize}".constantize
  end
end