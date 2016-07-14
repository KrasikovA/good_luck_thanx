require_relative 'connection'

namespace :db do
  desc "Migrate the database"
  task :migrate do
    ActiveRecord::Migrator.migrate('db/migrations',ENV["VERSION"] ? ENV["VERSION"].to_i : nil)
  end
end
