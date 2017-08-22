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
=end

get '/hello/:fname/?:lname?' do |f,l|
    "hello #{f} #{l}"
end