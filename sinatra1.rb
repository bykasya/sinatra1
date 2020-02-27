require 'sinatra'
enable :sessions

get "/set" do
    session[:message] = params[:message]
    "session saved"
end

get "/get" do
    session[:message]
end

get '/getdoc' do
 "<!DOCTYPE html>
    <html>
      <head>
        <style>
          body{ color:red}
        </style>
      </head>
      <body>
      … your stuff goes here ..
      </body>
    </html>"
end

post "/submitted" do
    "<h1>Form Submitted</h1>"
end

post "/logon" do
    if params[:username] == "bob" and params[:password]=="pass"
      "SUCCESS"
    else
      "FAILURE"
    end
end

post "/hello" do
    session[:name] = params[:name]
    "Saved the name"
end

get "/greet" do
    "Hello #{session[:name]}"
end

get "/erbtest" do
    erb :hello
end
