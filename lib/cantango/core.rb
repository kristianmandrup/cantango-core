require 'cantango/rails/railtie' if defined?(Rails)
require 'cantango/rails/engine' if defined?(Rails)

# essential cantango extensions
# require 'cantango/config'
# require 'cantango/api'

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
  autoload_modules :Ability, :Engine, :Filter
  autoload_modules :Helpers, :Loader, :Macros, :Model
  autoload_modules :Rules, :Scope
end

require 'cantango/macros'
