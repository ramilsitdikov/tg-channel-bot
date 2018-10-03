require 'aasm'
require 'active_record'
require 'dotenv'
require 'telegram/bot'
require 'vkontakte_api'

Dir.glob('./config/*.rb').each { |r| load r}

Dir.glob('./lib/models/*.rb').each { |r| load r}
Dir.glob('./lib/services/*.rb').each { |r| load r}
Dir.glob('./lib/state_machines/*.rb').each { |r| load r}

def app_env
  @app_env ||= ENV['APP_ENV'] || 'development'
end

def db_config
  app_env == 'production' ?
    {url: ENV['DATABASE_URL'], adapter: 'postgresql'} :
    YAML.load(
      File.read(
        File.join(
          File.expand_path('..', __FILE__), 'db', 'config.yml')))[app_env]
end

ActiveRecord::Base.establish_connection(db_config)
