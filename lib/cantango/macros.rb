module CanTango
  module Macros
    autoload_modules :User, :Account
  end
end

class Module
  [:User, :Account].each do |macro|
    self.send :include, "CanTango::Macros::#{macro.to_s.camelize}".constantize
  end
end
