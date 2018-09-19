# frozen_string_literal: true

require_relative 'application'

token = ENV['TELEGRAM_BOT_TOKEN']

Telegram::Bot::Client.run(token) do |bot|
  tg_bot = TgBot.new(bot)
  tg_bot.process_message
end
