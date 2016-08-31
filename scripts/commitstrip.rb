require_relative '../helper'
require 'nokogiri'
require 'open-uri'

url = 'http://www.commitstrip.com/en/?'
help = Helper.new(url)
page = Nokogiri::HTML(open(url))
new_comic = page.css('div.excerpts div.excerpt')[0].css('a')[0]['href']
help.send_new_comic(new_comic)
