require 'sinatra'
require 'sinatra/reloader'

get '/:name' do |n|
    # "hello #{n}" をテンプレートで表現
    @name = n
    @title = "main title"
    erb :index_va
end