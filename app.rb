require 'sinatra'
require 'sinatra/activerecord'
require './models'
require 'bundler/setup'
require 'rack-flash'

set :database, "sqlite3:ardemo.sqlite3"
set :sessions, true

enable :sessions

use Rack::Flash, sweep: true

get "/" do
  erb :index
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

def current_user
  if session[:user_id]
    @current_user = User.find session[:user_id]
  end
end