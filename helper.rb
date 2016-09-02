require 'telegram/bot'
require 'sqlite3'

class Helper
  def initialize
    @db = SQLite3::Database.new 'rscrap.db'
  end

  def execute(statement)
    @db.execute statement
  end

  def send_message(text)
    token = File.open('token', 'rb', &:read).chop
    id = File.open('user_id', 'rb', &:read).chop

    Telegram::Bot::Client.run(token) do |bot|
      bot.api.send_message(chat_id: id, text: text)
    end
  end

  def save_comic_id(url, old_comic, new_comic)
    case
    when old_comic.nil?, old_comic.empty?
      statement = "insert into websites values(\"#{url}\", \"#{new_comic}\");"
    when new_comic != old_comic
      statement = "update websites set id=\"#{new_comic}\" where url=\"#{url}\";"
    when new_comic == old_comic
      raise 'No new comic. Quitting.'
    end

    execute(statement)
  end

  def old_comic_id(url)
    old_comic = execute("SELECT id FROM websites WHERE url=\"#{url}\";")
    old_comic.first.first unless old_comic.empty?
  end

  def send_new_comic(url, new_comic)
    old_comic = old_comic_id(url)
    save_comic_id(url, old_comic, new_comic)
    send_message("Got you a new Commitstrip Comic: #{new_comic}")
  end

  def update_reddit(subreddit, id)
    execute("update websites set postid=\"#{id}\" where subreddit=\"#{subreddit}\";")
  end

  def insert_reddit(subreddit, id)
    execute("insert into reddits values(\"#{subreddit}\", \"#{id}\");")
  end

  def fetch_reddit(subreddit)
    old_post_id = execute("SELECT postid FROM reddits WHERE subreddit=\"#{subreddit}\";")
    old_post_id.first.first unless old_post_id.empty?
  end
end
