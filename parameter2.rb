require 'sinatra'
require 'sinatra/reloader'

#ワイルドカード
get '/form/*/to/*' do |f,t|
    "hello #{f} to #{t}"
end

#正規表現
get %r{/users/([0-9]*)} do |i|
    "users id = #{i}"
end