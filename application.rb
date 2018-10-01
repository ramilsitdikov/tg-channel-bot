require 'telegram/bot'
require 'vkontakte_api'

require 'active_record'
require 'dotenv'

require_relative 'models/tg_bot'
require_relative 'lib/vk_auth'

def db_configuration
  db_configuration_file = File.join(File.expand_path('..', __FILE__), 'db', 'config.yml')
  YAML.load(File.read(db_configuration_file))
end

ActiveRecord::Base.establish_connection(db_configuration['development'])
