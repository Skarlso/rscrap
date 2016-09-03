require_relative '../helper'
require 'jsonpathv2'
require 'open-uri'
require 'json'

help = Helper.new
to_scrap = { golang: 'https://www.reddit.com/r/golang/new.json',
             ruby: 'https://www.reddit.com/r/ruby/new.json',
             php: 'https://www.reddit.com/r/php/new.json',
             aws: 'https://www.reddit.com/r/aws/new.json',
             docker: 'https://www.reddit.com/r/docker/new.json',
             devops: 'https://www.reddit.com/r/devops/new.json',
             bash: 'https://www.reddit.com/r/bash/new.json' }

posts = {}

last = help.last_record(:golang)
last_record = last.nil? ? 0 : last.first
content = open(to_scrap[:golang], 'User-Agent' => "RScrappy/#{RUBY_VERSION}").read
JsonPath.new('$.data.children').on(content).first.each do |o|
  new_id = JsonPath.on(o, '$.data.id').first
  new_timestamp = JsonPath.on(o, '$.data.created').first.to_i
  new_title = JsonPath.on(o, '$.data.title').first
  next if new_timestamp <= last_record
  posts[:golang] = [] unless posts.key? :golang
  posts[:golang] << new_title
  help.insert_reddit(:golang, new_id, new_timestamp)
end

help.send_posts(posts)
