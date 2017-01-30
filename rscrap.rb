require 'telegram/bot'
require 'sqlite3'
require 'bitly'

# Rscrap is the main class which handles most of the functionality for the cron scripts.
class Rscrap
  def initialize
    @db = SQLite3::Database.new 'rscrap.db'
    @token = fetch_variable('RSCRAP_TOKEN')
    @id = fetch_variable('RSCRAP_USER_ID')
  end

  def fetch_variable(var)
    variable = ENV.fetch(var, '')
    raise "Please setup the environment property '#{var}'." if variable.empty?
    variable
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
    case old_comic
    when nil, []
      statement = "insert into websites values(\"#{url}\", \"#{new_comic}\");"
    when new_comic
      raise 'No new comic. Quitting.'
    else
      statement = "update websites set id=\"#{new_comic}\" where url=\"#{url}\";"
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
    send_message("Got you a new post: #{new_comic}")
  end

  def insert_reddit(subreddit, id, stamp)
    execute("insert into reddits values(\"#{subreddit}\", \"#{id}\", #{stamp});")
  end

  def last_record(subreddit)
    last_record = execute <<-SQL
                            SELECT stamp FROM reddits WHERE subreddit=\"#{subreddit}\" AND stamp =
                            (SELECT MAX(stamp) FROM reddits WHERE subreddit=\"#{subreddit}\");
                          SQL
    last_record&.first
  end

  def send_posts(posts)
    to_send = []
    posts.each do |k, v|
      to_send << "\nNew Post: #{k} => #{v.join("\n")}\n----------------"
    end
    message = to_send.join("\n")
    return if message.empty?
    send_message(message)
  end

  def bitly_enabled?
    ENV.key?('RSCRAP_BITLY_USERNAME')
  end

  def shorten_url(url)
    Bitly.use_api_version_3
    bitly = Bitly.new(ENV['RSCRAP_BITLY_USERNAME'], ENV['RSCRAP_BITLY_API_KEY'])
    bitly.shorten(url).short_url
  end
end
