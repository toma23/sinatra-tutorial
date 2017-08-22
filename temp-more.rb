require 'sinatra'
require 'sinatra/reloader'

get '/' do
    @title = "main index"
    @content = "main content"
    erb :index_con
end

get '/about' do
    @title = "about this page"
    @content = "this page is ..."
    @email = "nnn@nnn.nn"
    erb :about
end