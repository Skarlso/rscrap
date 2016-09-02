require_relative '../helper'
require 'nokogiri'
require 'open-uri'

url = 'http://www.collectedcurios.com/'
help = Helper.new
url_for_comic = 'http://www.collectedcurios.com/sequentialart.php'
page = Nokogiri::HTML(open(url_for_comic))
comic_id = page.css('img#strip')[0].select { |e| e if e[0] == 'src' }[0][1]
new_comic = "#{url}#{comic_id}"
help.send_new_comic(url, new_comic)
