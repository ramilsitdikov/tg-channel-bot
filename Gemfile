source 'https://rubygems.org'
ruby '2.5.1'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'aasm'
gem 'activerecord', '~> 5.2.1'
gem 'dotenv-rails'
gem 'pg'
gem 'standalone_migrations'
gem 'telegram-bot-ruby'
gem 'vkontakte_api'

group :test, :development do
  gem 'byebug'
end
