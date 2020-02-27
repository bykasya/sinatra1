require "sqlite3"
require "sinatra"
require "sinatra/reloader"

 if File.exists?("maindata.db")
     File.delete ("maindata.db")
 end

 db=SQLite3::Database.new("maindata.db")
 db.execute <<-SQL
    create table users(
      id integer primary key,
      name varchar,
      email varchar,
      password varchar);
  SQL

db.execute("insert into users(name, email, password) values(?, ?, ?);", ["Mary", "mary@example.com", "mary123"])
db.execute("insert into users(name, email, password) values(?, ?, ?);", ["Anna", "anna@example.com", "anna456"])
db.execute("insert into users(name, email, password) values(?, ?, ?);", ["Bob", "bob@example.com", "bob789"])

 get "/" do
  @results=db.execute("SELECT*FROM users;")
  erb :results
 end
