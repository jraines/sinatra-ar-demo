require 'sinatra'
require 'sinatra/activerecord'
require './models'
require 'bundler/setup'
require 'rack-flash'

set :database, "sqlite3:ardemo.sqlite3"
#set :sessions, true

enable :sessions

use Rack::Flash, sweep: true

get "/" do
  if current_user
    erb :index
  else
    redirect '/login'
  end
end

get '/login' do
  erb :login
end

get '/welcome' do
  if current_user
    erb :welcome 
  else
    flash[:notice] = "Please log in"
    redirect '/'
  end
end

post "/login" do
  username = params[:username]
  password = params[:password]

  @user = User.where(username: username).first

  if @user.password == password
    session[:user_id] = @user.id
    flash[:notice] = "Welcome #{@user.username}!"
    redirect '/welcome'
  else
    flash[:notice] = "Wrong login info, please try again"
    redirect '/'
  end
end

get '/signout' do

  session[:user_id] = nil
  flash[:notice] = "Signed Out Successfully.  Come back soon!"
  redirect '/'
end

def current_user
  if session[:user_id]
    User.find session[:user_id]
  end
end