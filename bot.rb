# frozen_string_literal: true

require 'telegram/bot'

token = ENV['TELEGRAM_BOT_TOKEN']

Telegram::Bot::Client.run(token) do |bot|

  bot.listen do |message|
    case message.text
    when '/start'
      text = "id: #{message.from.id}, first_name: #{message.from.first_name}"
      bot.api.send_message(chat_id: message.chat.id, text: text)
    when '/add_chat'
      id = message.from.first_name.id
    when '/end'
      bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}!")
    else
      bot.api.send_message(chat_id: message.chat.id, text: "I don't understand you :(")
    end
  end
end
