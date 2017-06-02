require_relative '../rscrap'
require 'nokogiri'
require 'open-uri'

url = 'https://xkcd.com/'
scrap = Rscrap.new
page = Nokogiri::HTML(open(url))
comic_id = page.css('div#comic').css('img')[0].select { |e| e if e[0] == 'src' }[0][1]
new_comic = "http:#{comic_id}"
scrap.send_new_comic(url, new_comic)
