source :rubygems

group :default do
  gem 'rails',            '>= 3.0.1'
  gem 'cancan',           '>= 1.4'
  gem 'sugar-high',       '>= 0.6.0'
  gem 'sweetloader',      '~> 0.1.0'
  gem 'hashie'
  
  # gem 'cantango-config',  :git => 'git://github.com/kristianmandrup/cantango-config.git'
  # gem 'cantango-api',     :git => 'git://github.com/kristianmandrup/cantango-api.git'
end

group :test do
  gem 'require_all', '~> 1.2.0'

  # Data
  gem 'database_cleaner'
  gem 'factory_girl'

  # Specs
  gem 'spork'
  gem 'capybara'
  gem 'rails-app-spec', '>= 0.5.0'
  gem 'mocha'
  gem "launchy"

  # Debug and performance tests
  gem 'cutter'

  # Integration testing
  gem 'decent_exposure'
  gem "friendly_id"
  gem "devise",         '>= 1.4'

  # Rails
  gem 'haml'

  # Generators
  gem 'generator-spec', '>= 0.7.8'
end

group :development, :test do
  gem "rspec-rails",  '>= 2.6.1'  # needed in development to expose the rails generators
  gem 'forgery',      '>= 0.3' # needed in development when using rake db:seed
  gem 'factory_girl'
  gem 'sqlite3'
end

group :development do
  gem "rspec",    ">= 2.6.0"
  gem "jeweler",  ">= 1.6.4"
  gem "bundler",  ">= 1.1.rc"
  gem "rdoc"
  gem 'rake',     '>= 0.9.2.2'
end

