require_relative '../helper'
require 'rubygems'
require 'nokogiri'
require 'open-uri'

help = Helper.new
url = 'http://www.gunnerkrigg.com'
page = Nokogiri::HTML(open(url))
comic_id = page.css('img.comic_image')[0].select { |e| e if e[0] == 'src' }[0][1]

old_comic = help.get_old_comic_id(url)
new_comic = "#{url}#{comic_id}"

help.save_comic_id(url, old_comic, new_comic)
help.send_message("Got you a new Gunnerkrigg Court comic: #{new_comic}")
