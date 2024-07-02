# frozen_string_literal: true
shedule_file = 'config/schedule.yml'
if File.exist?(shedule_file) && !File.empty?(shedule_file) && Sidekiq.server?
  Sidekiq::Cron::Job.load_from_hash YAML.load_file(shedule_file)
end
# Sidekiq.configure_server do |config|
#   config.failures_max_count = 1000
# end
