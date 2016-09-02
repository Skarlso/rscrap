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

# So far, this is missing all the post which came afterwards. This needs to be altered to handle
# multiple submitted posts, AFTER the one that was stored last.
to_scrap.each do |k, v|
  puts "fetching #{v}"
  content = open(v, 'User-Agent' => "RScrappy/#{RUBY_VERSION}").read
  new_post_id = JsonPath.new('$.data.children[0].data.id').on(JSON.parse(content)).first
  new_post_title = JsonPath.new('$.data.children[0].data.title').on(JSON.parse(content)).first
  old_post_id = help.fetch_reddit(k)

  case
  when old_post_id.nil?
    help.insert_reddit(k, new_post_id)
    help.send_message("New Post in subreddit: #{k}; title: #{new_post_title}")
  when old_post_id != new_post_id
    help.update_reddit(k, new_post_id)
    help.send_message("New Post in subreddit: #{k}; title: #{new_post_title}")
  when old_post_id == new_post_id
    next
  end
end
