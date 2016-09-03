require_relative '../rscrap'
require 'nokogiri'
require 'open-uri'

url = 'http://www.goblinscomic.org/'
scrap = Rscrap.new
page = Nokogiri::HTML(open(url))
new_comic = page.css('div#comic img')[0].select { |e| e if e[0] == 'src' }[0][1]
scrap.send_new_comic(url, new_comic)
