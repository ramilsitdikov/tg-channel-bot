source 'https://rubygems.org'
ruby '2.5.1'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'vkontakte_api', '~> 1.4'
gem 'telegram-bot-ruby'

gem 'byebug', groups: %w(development test)
gem 'dotenv-rails', groups: %w(development test)
