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
  task :reboot_bot do
    bot_pid = File.read("pid")
    begin
      Process.kill(0,bot_pid.to_i)
    rescue Errno::ESRCH
      system "/home/deployer/apps/good_luck_thanx/run_bot.sh"
    end
  end
end
