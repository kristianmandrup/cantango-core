require 'active_record'
require 'database_cleaner'

path = File.dirname(__FILE__) + '/db/database.yml'
dbfile = File.open(path)
dbconfig = YAML::load(dbfile)
ActiveRecord::Base.establish_connection(dbconfig)
# ActiveRecord::Base.logger = Logger.new(STDERR)
DatabaseCleaner.strategy = :truncation

def migration_folder
  File.join(File.dirname(__FILE__), 'active_record')
end

def migrate!
  ActiveRecord::Migrator.migrate File.join(File.dirname(__FILE__), 'active_record')
end
