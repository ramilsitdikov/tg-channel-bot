class TgBot
  attr_reader :bot
  attr_accessor :state

  def initialize(bot)
    @bot = bot
    @state = :init
  end

  def process_message
    bot.listen do |message|
      chat_id = message.chat.id

      case message.text
      when '/start'
        text = "Hello, #{message.from.first_name}!"
        send_message(chat_id, text)
      when '/message'
        text = "message: #{message.inspect}"
        send_message(chat_id, text)
      when '/login_vk'
        text = VkAuth.authorization_url
        state = :auth_start
        send_message(chat_id, text)
      when '/end'
        send_message(chat_id, "Bye, #{message.from.first_name}!")
      else
        send_message(chat_id, 'I do not understand you.')
      end
    end
  end

  private

    def send_message(chat_id, text)
      bot.api.send_message(chat_id: chat_id, text: text)
    end
end
