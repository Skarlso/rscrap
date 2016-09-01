require 'jsonpathv2'
require 'open-uri'

to_scrap = ['https://www.reddit.com/r/golang/new.json',
            'https://www.reddit.com/r/ruby/new.json',
            'https://www.reddit.com/r/php/new.json',
            'https://www.reddit.com/r/aws/new.json',
            'https://www.reddit.com/r/docker/new.json',
            'https://www.reddit.com/r/devops/new.json',
            'https://www.reddit.com/r/bash/new.json']

puts "fetching #{to_scrap[0]}"
content = open(to_scrap[0], 'User-Agent' => "RScrappy/#{RUBY_VERSION}").read

puts content
