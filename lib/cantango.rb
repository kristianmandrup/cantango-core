require 'cantango/rails/railtie' if defined?(Rails)
require 'cantango/rails/engine' if defined?(Rails)
require 'cancan'
require 'active_support' # for Delegate module
require 'active_support/core_ext/module/delegation'
require 'cantango/cancan/rule'
require 'sugar-high/array'
require 'sugar-high/blank'
require 'hashie'
require 'sweetloader'

AutoLoader.namespaces = {:CanTango => 'cantango'}

module CanTango
  autoload_modules :Ability
  autoload_modules :Engine
  autoload_modules :Rules, :Helpers, :Filter, :Model, :Scope, :YamlLoader
  autoload_modules :Rails, :Macros

  class << self
    def configure &block
      conf = CanTango::Configuration.instance
      yield conf if block
      conf
    end

    alias_method :config, :configure

    # Engine hook
    # Run after the initializers are ran for all Railties (including the application itself), but before eager loading and the middleware stack is built. 
    # More importantly, will run upon every request in development, but only once (during boot-up) in production and test.
    def to_prepare
      config.hook(:to_prepare).call if config.hook(:to_prepare)
    end

    # engine hook, run after all Rails initializations have been executed
    def after_initialize
      config.hook(:after_initialize).call if config.hook(:after_initialize)
    end

    def permits_allowed candidate, actions, subjects, *extra_args
      raise "Debugging has not been turned on. Turn it on using: CanTango.debug!" if CanTango.config.debug.off?
      config.permits.allowed candidate, actions, subjects, *extra_args
    end

    def permits_denied candidate, actions, subjects, *extra_args
      raise "Debugging has not been turned on. Turn it on using: CanTango.debug!" if CanTango.config.debug.off?
      config.permits.denied candidate, actions, subjects, *extra_args
    end

    def debug_permits_registry
      puts "permits registry:" << CanTango.config.permits.show_all.inspect
    end

    def debug_ability candidate, actions, subjects, *extra_args
      puts "Ability: #{actions} on #{subjects}"
      puts "permits allowed:" << permits_allowed(candidate, actions, subjects, *extra_args).inspect
      puts "permits denied:"  << permits_denied(candidate, actions, subjects, *extra_args).inspect
    end

    def clear_permits_executed!
      config.permits.clear_executed!
    end

    def debug!
      config.debug.set :on
    end

    def debug_off!
      config.debug.set :off
    end

    def debug?
      config.debug.on?
    end
  end
end

require 'cantango/macros'
