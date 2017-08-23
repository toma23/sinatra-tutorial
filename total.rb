require 'sinatra'
require 'sinatra/reloader'

=begin
get '/hello/:name' do
  "hello #{params[:name]}"
end

get '/about' do
  "about this site page"
end

get '/hello/:name' do |n|
  "hello #{n}"
end

#複数のパラメータ
get '/hello/:fname/?:lname?' do |f, l|
  "hello #{f} #{l}"
end

#ワイルドカード
get '/form/*/to/*' do |f, t|
  "hello #{f} to #{t}"
end

#正規表現
get %r{/users/([0-9]*)} do |i|
  "users id = #{i}"
end

#erbテンプレートであるindex.erbを呼び出し
get '/' do
  erb :index
end

#テンプレートで変数を利用
get '/:name' do |n|
  # "hello #{n}" をテンプレートで表現
  @name = n
  @title = "main title"
  erb :index_va
end

#layout.erbを用いて，複数テンプレートの共通部分を管理
get '/' do
  @title = "main index"
  @content = "main content"
  erb :index_con
end

get '/about' do
  @title = "about this page"
  @content = "this page is..."
  @email = "nnn@nnn.nn"
  erb :about
end
=end

#helper命令を用いて，strong命令を登録&利用
before '/admin/*' do
  @msg = "admin area!"
end

before do
  @author = "t"
end

after do
  logger.info "page displayed successfully"
end

helpers do
  def strong(s)
    "<strong>#{s}</strong>"
  end
end

get '/' do
  @title = "main index"
  @content = "main content by" + @author
  erb :index_con2
end

get '/about' do
  @title = "about this page"
  @content = "this page is ... by" + strong(@author)
  @email = "nnn@nnn.nn"
  erb :about2
end