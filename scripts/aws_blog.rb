require_relative '../rscrap'
require 'nokogiri'
require 'open-uri'

url = 'https://aws.amazon.com/blogs/aws/'
scrap = Rscrap.new
page = Nokogiri::HTML(open(url))
new_comic = page.css('div.posts')[0].css('article.post')[0].css('a')[0]['href']
scrap.send_new_comic(url, new_comic)
