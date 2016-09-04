require_relative '../rscrap'
require 'jsonpathv2'
require 'open-uri'
require 'json'

scrap = Rscrap.new
to_scrap = { golang: 'https://www.reddit.com/r/golang/new.json?limit=10',
             ruby: 'https://www.reddit.com/r/ruby/new.json?limit=10',
             php: 'https://www.reddit.com/r/php/new.json?limit=10',
             aws: 'https://www.reddit.com/r/aws/new.json?limit=10',
             docker: 'https://www.reddit.com/r/docker/new.json?limit=10',
             devops: 'https://www.reddit.com/r/devops/new.json?limit=10',
             bash: 'https://www.reddit.com/r/bash/new.json?limit=10' }

posts = {}
to_scrap.each do |k, v|
  last = scrap.last_record(k)
  last_record = last.nil? ? 0 : last.first.to_i
  content = open(v, 'User-Agent' => "RScrappy/#{RUBY_VERSION}").read
  JsonPath.new('$.data.children').on(content).first.each do |o|
    new_id = JsonPath.on(o, '$.data.id').first
    new_timestamp = JsonPath.on(o, '$.data.created').first.to_i
    new_title = JsonPath.on(o, '$.data.title').first
    next if new_timestamp <= last_record
    posts[k] = [] unless posts.key? k
    posts[k] << new_title
    scrap.insert_reddit(k, new_id, new_timestamp)
  end
end

scrap.send_posts(posts)
