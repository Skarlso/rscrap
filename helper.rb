require 'telegram/bot'

def send_message(text)
  token = File.open('token', 'rb', &:read).chop
  id = File.open('user_id', 'rb', &:read).chop

  Telegram::Bot::Client.run(token) do |bot|
    bot.api.send_message(chat_id: id, text: text)
  end
end
