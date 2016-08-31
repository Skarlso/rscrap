require_relative '../helper'
require 'nokogiri'
require 'open-uri'

url = 'http://www.goblinscomic.org/'
help = Helper.new(url)
page = Nokogiri::HTML(open(url))
new_comic = page.css('div#comic img')[0].select { |e| e if e[0] == 'src' }[0][1]
help.send_new_comic(new_comic)
