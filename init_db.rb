require 'sqlite3'
# Initializes the database. The format to use if there are more tables
# is simple. Just create a SQL file corresponding to the table name
# and add that table to the @tables instance variable.
class InitDb
  def initialize
    @db = SQLite3::Database.new 'rscrap.db'
    @tables = %w(reddits websites)
  end

  def table_exists?(table)
    retrieved = @db.execute <<-SQL
      SELECT name FROM sqlite_master WHERE type='table' AND name='#{table}';
    SQL
    retrieved.first.first == table unless retrieved.nil? || retrieved.empty?
  end

  def init_db
    @tables.each do |table|
      @db.execute File.open("#{table}.sql", 'rb', &:read).chop unless table_exists? table
    end
  end
end

InitDb.new.init_db
