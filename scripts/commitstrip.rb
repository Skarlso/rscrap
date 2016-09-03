require_relative '../rscrap'
require 'nokogiri'
require 'open-uri'

url = 'http://www.commitstrip.com/en/?'
scrap = Rscrap.new
page = Nokogiri::HTML(open(url))
new_comic = page.css('div.excerpts div.excerpt')[0].css('a')[0]['href']
scrap.send_new_comic(url, new_comic)
