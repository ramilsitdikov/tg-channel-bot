require 'standalone_migrations'
require_relative 'application'

StandaloneMigrations::Tasks.load_tasks
Dir.glob('./tasks/*.rake').each { |r| load r}
