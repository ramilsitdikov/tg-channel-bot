# export http_proxy=http://6b729e9610874674ae66c2b41cf97499:810HNpDSAdlfe8hiHYIo@srv2.telegram.online:1080
# export https_proxy=$http_proxy

# frozen_string_literal: true

require 'byebug'
require 'rubygems'
require 'telegram/bot'

token = '455987284:AAEudokP92LmJqJWlavEaX-XXzEfXOIQE7U'

Telegram::Bot::Client.run(token) do |bot|
  byebug

  bot.listen do |message|
    case message.text
    when '/start'
      bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}!")
    when '/end'
      bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}!")
    else
      bot.api.send_message(chat_id: message.chat.id, text: "I don't understand you :(")
    end
  end
end
