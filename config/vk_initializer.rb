require 'dotenv'

Dotenv.load

vk_app_id = ENV['VK_APP_ID']
vk_app_secret = ENV['VK_APP_SECRET']
vk_redirect_url = ENV['VK_REDIRECT_URL']

VkontakteApi.configure do |config|
  config.app_id       = vk_app_id
  config.app_secret   = vk_app_secret
  config.redirect_uri = vk_redirect_url

  config.log_requests  = true
  config.log_errors    = true
  config.log_responses = true

  config.api_version = '5.85'
end
