require 'sinatra'
require 'sinatra/reloader'

get '/howmany' do
    erb :howmany
end

post '/candles' do
    @candlenum = params[:candlenum].to_i
    erb :candles
end