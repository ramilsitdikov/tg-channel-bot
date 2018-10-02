require 'aasm'
require 'active_record'
require 'dotenv'
require 'telegram/bot'
require 'vkontakte_api'

Dir.glob('./config/*.rb').each { |r| load r}

Dir.glob('./lib/models/*.rb').each { |r| load r}
Dir.glob('./lib/services/*.rb').each { |r| load r}
Dir.glob('./lib/state_machines/*.rb').each { |r| load r}

def db_config
  db_config_file = File.join(File.expand_path('..', __FILE__), 'db', 'config.yml')
  YAML.load(File.read(db_config_file))
end

ActiveRecord::Base.establish_connection(db_config['development'])
