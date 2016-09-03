require 'sqlite3'

raise 'Database already initialized.' if File.exist?('rscrap.db')

db = SQLite3::Database.new 'rscrap.db'

db.execute <<-SQL
  create table websites (
    url varchar(100),
    id varchar(100),
    PRIMARY KEY (url)
  );
SQL

db.execute <<-SQL
  create table reddits (
    subreddit varchar(100),
    postid varchar(100),
    stamp integer,
    PRIMARY KEY (postid)
  );
SQL
