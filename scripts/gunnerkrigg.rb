require_relative '../rscrap'
require 'nokogiri'
require 'open-uri'

url = 'http://www.gunnerkrigg.com'
scrap = Rscrap.new
page = Nokogiri::HTML(open(url))
comic_id = page.css('img.comic_image')[0].select { |e| e if e[0] == 'src' }[0][1]
new_comic = "#{url}#{comic_id}"
scrap.send_new_comic(url, new_comic)
