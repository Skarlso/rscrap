require 'telegram/bot'
require 'sqlite3'

class Rscrap
  def initialize
    @db = SQLite3::Database.new 'rscrap.db'
    @token = ENV.fetch('RSCRAP_TOKEN', '')
    @id = ENV.fetch('RSCRAP_USER_ID', '')
  end

  def execute(statement)
    @db.execute statement
  end

  def send_message(text)
    Telegram::Bot::Client.run(@token) do |bot|
      bot.api.send_message(chat_id: @id, text: text)
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
    send_message("Got you a new comic: #{new_comic}")
  end

  def insert_reddit(subreddit, id, stamp)
    execute("insert into reddits values(\"#{subreddit}\", \"#{id}\", #{stamp});")
  end

  def last_record(subreddit)
    last_record = execute <<-SQL
                            SELECT stamp FROM reddits WHERE subreddit=\"#{subreddit}\" AND stamp =
                            (SELECT MAX(stamp) FROM reddits WHERE subreddit=\"#{subreddit}\");
                          SQL
    last_record.first unless last_record.nil?
  end

  def send_posts(posts)
    to_send = []
    posts.each do |k, v|
      to_send << "\nNew Post: #{k} => #{v.join("\n")}\n----------------"
    end
    message = to_send.join("\n")
    return if message.empty?
    Telegram::Bot::Client.run(@token) do |bot|
      bot.api.send_message(chat_id: @id, text: message)
    end
  end
end
