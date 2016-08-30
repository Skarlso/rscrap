require_relative '../helper'
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'sqlite3'

url = 'http://www.gunnerkrigg.com'
page = Nokogiri::HTML(open(url))
comic_id = page.css('img.comic_image')[0].select { |e| e if e[0] == 'src' }[0][1]

new_comic = "#{url}#{comic_id}"
send_message("Got you a new Gunnerkrigg Court comic: #{new_comic}")
