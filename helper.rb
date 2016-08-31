require 'telegram/bot'
require 'sqlite3'

class Helper
  def initialize(url)
    @db = SQLite3::Database.new 'rscrap.db'
    @url = url
  end

  def send_message(text)
    token = File.open('token', 'rb', &:read).chop
    id = File.open('user_id', 'rb', &:read).chop

    Telegram::Bot::Client.run(token) do |bot|
      bot.api.send_message(chat_id: id, text: text)
    end
  end

  def save_comic_id(old_comic, new_comic)
    case
    when old_comic.nil?, old_comic.empty?
      statement = "insert into websites values(\"#{@url}\", \"#{new_comic}\");"
    when new_comic != old_comic
      statement = "update websites set id=\"#{new_comic}\" where url=\"#{@url}\";"
    when new_comic == old_comic
      raise 'No new comic. Quitting.'
    end

    @db.execute statement
  end

  def get_old_comic_id
    old_comic = @db.execute("SELECT id FROM websites WHERE url=\"#{@url}\";")
    old_comic.first.first unless old_comic.empty?
  end

  def send_new_comic(new_comic)
    old_comic = get_old_comic_id
    save_comic_id(old_comic, new_comic)
    send_message("Got you a new Commitstrip Comic: #{new_comic}")
  end
end
