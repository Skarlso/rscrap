require_relative '../helper'
require 'nokogiri'
require 'open-uri'

help = Helper.new
url = 'http://www.collectedcurios.com/'
url_for_comic = 'http://www.collectedcurios.com/sequentialart.php'
page = Nokogiri::HTML(open(url_for_comic))
comic_id = page.css('img#strip')[0].select { |e| e if e[0] == 'src' }[0][1]

old_comic = help.get_old_comic_id(url)
new_comic = "#{url}#{comic_id}"

help.save_comic_id(url, old_comic, new_comic)
help.send_message("Got you a new Sequential Art comic: #{new_comic}")
