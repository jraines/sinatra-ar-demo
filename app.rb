require 'sinatra'
require 'sinatra/activerecord'
require './models'

set :database, "sqlite3:ardemo.sqlite3"
set :sessions, true

get "/" do
  erb :index
end

get '/welcome' do
  if current_user
    "Welcome #{current_user.username}"
  else
    "please go back to login and login"
  end
end

post "/login" do
  username = params[:username]
  password = params[:password]

  @user = User.where(username: username).first

  if @user.password == password
    session[:user_id] = @user.id
    redirect '/welcome'
  else
    "LOGIN ERROR!!!!!!!"
  end
end

def current_user
  if session[:user_id]
    @current_user = User.find session[:user_id]
  end
end