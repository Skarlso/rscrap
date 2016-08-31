require_relative '../helper'
require 'nokogiri'
require 'open-uri'

help = Helper.new

url = 'http://www.commitstrip.com/en/?'
page = Nokogiri::HTML(open(url))
new_comic = page.css('div.excerpts div.excerpt')[0].css('a')[0]['href']
old_comic = help.get_old_comic_id(url)

help.save_comic_id(url, old_comic, new_comic)
help.send_message("Got you a new Commitstrip Comic: #{new_comic}")
