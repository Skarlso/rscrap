require 'telegram_bot'

token = File.open('token', 'rb', &:read).chop
bot = TelegramBot.new(token: token)

bot.get_updates(fail_silently: true) do |message|
  greet = message.from.username.empty? ? message.from.first_name : message.from.username
  puts "@#{greet}: #{message.text}"
  command = message.get_command_for(bot)

  message.reply do |reply|
    reply.text = case command
                 when %r{\/start}
                   "Welcome, #{greet}. My name is RScrappy. How may I help?"
                 when /greet/i
                   "Hello, #{greet}!"
                 else
                   "#{greet}, have no idea what #{command.inspect} means."
                 end
    puts "Sending text to: #{greet}"
    reply.send_with(bot)
  end
end
