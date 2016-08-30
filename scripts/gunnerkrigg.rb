require_relative '../helper'
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'sqlite3'

db = SQLite3::Database.new 'rscrap.db'

url = 'http://www.gunnerkrigg.com'
page = Nokogiri::HTML(open(url))
comic_id = page.css('img.comic_image')[0].select { |e| e if e[0] == 'src' }[0][1]

old_comic = db.execute("SELECT id FROM websites WHERE url=\"#{url}\";").first.first
new_comic = "#{url}#{comic_id}"

case
when old_comic.empty?
  statement = "insert into websites values(\"#{url}\", \"#{new_comic}\");"
when new_comic != old_comic
  statement = "update websites set id=\"#{new_comic}\" where url=\"#{url}\";"
when new_comic == old_comic
  raise 'No new comic. Quitting.'
end

db.execute statement
send_message("Got you a new Gunnerkrigg Court comic: #{new_comic}")
