require 'rspec'
require 'cantango/rspec'
require 'cantango/core'

def config_folder
  File.dirname(__FILE__)+ "/fixtures/config/"
end

class Project
end

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|  
end
