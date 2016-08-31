require_relative '../helper'
require 'rubygems'
require 'nokogiri'
require 'open-uri'

help = Helper.new
url = 'http://www.goblinscomic.org/'
page = Nokogiri::HTML(open(url))
new_comic = page.css('div#comic img')[0].select { |e| e if e[0] == 'src' }[0][1]
old_comic = help.get_old_comic_id(url)

help.save_comic_id(url, old_comic, new_comic)
help.send_message("Got you a new Goblins comic: #{new_comic}")
