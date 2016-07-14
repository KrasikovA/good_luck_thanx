require 'active_record'
require 'yaml'

db_config = YAML.load_file('db/database.yml')
ActiveRecord::Base.logger = Logger.new(STDERR)
ActiveRecord::Base.establish_connection(db_config)

