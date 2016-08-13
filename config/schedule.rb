# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#

set :output, "/home/deployer/apps/good_luck_thanx/cron_log.log"
every 1.day, :at => '11 am' do
  rake "whenever:set_morning_default"
end
every 1.day, :at => '11 pm' do
  rake "whenever:set_evening_default"
end
every 10.minutes do
 rake "whenever:reboot_bot"
end
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
