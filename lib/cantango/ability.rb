module CanTango
  module Ability
    autoload_modules :Base, :Cache, :Executor, :Helper, :Callbacks
    
    # by default add callbacks?
    # class Base
    #   include Callbacks
    # end
  end
end