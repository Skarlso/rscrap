require_relative '../helper'
require 'nokogiri'
require 'open-uri'

url = 'http://www.gunnerkrigg.com'
help = Helper.new(url)
page = Nokogiri::HTML(open(url))
comic_id = page.css('img.comic_image')[0].select { |e| e if e[0] == 'src' }[0][1]
new_comic = "#{url}#{comic_id}"
help.send_new_comic(new_comic)
