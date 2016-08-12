require_relative 'connection'
require_relative 'duty'
namespace :db do
  desc "Migrate the database"
  task :migrate do
    ActiveRecord::Migrator.migrate('db/migrations',ENV["VERSION"] ? ENV["VERSION"].to_i : nil)
  end
end
namespace :whenever do
  desc "Update duty status"
  task :set_morning_default do
    Duty.update_all(morning_greeting: true, evening_greeting: false)   
  end
  task :set_evening_default do
    Duty.update_all(morning_greeting: false, evening_greeting: true)
  end
end
