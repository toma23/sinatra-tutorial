require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

ActiveRecord::Base.establish_connection(
    "adapter" => "sqlite3",
    "database" => "~/sqlite-tools-win32-x86-3200000/bbs.db"
)

class Comment < ActiveRecord::Base
end

get '/' do
    @comments = Comment.order("id desc").all
    erb :index_db
end