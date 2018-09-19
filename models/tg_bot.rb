class TgBot
  attr_reader :bot
  def initialize(bot)
    @bot = bot
  end

  def process_message
    bot.listen do |message|
      chat_id = message.chat.id

      case message.text
      when '/start'
        text = "id: #{message.from.id}, first_name: #{message.from.first_name}"
        bot.api.send_message(chat_id: chat_id, text: text)
      when '/message'
        text = "message: #{message.inspect}"
        bot.api.send_message(chat_id: chat_id, text: text)
      when '/end'
        bot.api.send_message(chat_id: chat_id, text: "Bye, #{message.from.first_name}!")
      else
        bot.api.send_message(chat_id: chat_id, text: "I don't understand you.")
      end
    end
  end
end