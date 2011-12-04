require 'cancan'
require 'active_support' # for Delegate module
require 'active_support/core_ext/module/delegation'

require 'cantango/can_can/rule'
require 'sugar-high/array'
require 'sugar-high/blank'
require 'hashie'
require 'sweetloader'

SweetLoader.namespaces = {:CanTango => 'cantango'}
SweetLoader.mode = :require

module CanTango
  autoload_modules :Helpers, :Ability, :Engine, :Filter
  autoload_modules :Loader, :Model, :Adaptor
  autoload_modules :Scope, :CanCan
end
