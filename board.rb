require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

ActiveRecord::Base.establish_connection(
  "adapter" => "sqlite3",
  "database" => "./bbs.db"
)

#エスケープの決まり文句
helpers do
  include Rack::Utils
  alias_method :h, :escape_html   #escape_htmlをhで呼べるようにしてる
end

class Comment < ActiveRecord::Base
end

get '/' do
  @comments = Comment.order("id desc").all
  erb :index_db
end

#ホームに入力された文字を登録
post '/new' do
  Comment.create({:body => params[:body]})
  redirect '/'
end

#コメントを削除する
post '/delete' do
  Comment.find(params[:id]).destroy
 end