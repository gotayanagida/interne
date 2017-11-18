# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron
# require File.expand_path(File.dirname(__FILE__) + "/environment")
# set :output, 'log/cron.log'
set :output, "log/crontab.log"
set :environment, :development

every 1.days, at: '18:59' do
  rake "mail:send_day_before_to_staffs"
end

every 1.days, at: '18:59' do
  rake "mail:send_day_before_to_interns"
end

every 1.days, at: '12:29' do
  rake "mail:seven_days_nothing_schedule"
end

# Example:
#
# set :output, "/path/to/my/cron_log.log"
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
