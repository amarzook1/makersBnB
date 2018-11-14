require 'sinatra/base'
require './lib/user'
require './lib/space'

class Makersbnb < Sinatra::Base
  set :method_override, true

  get '/' do
    redirect :login
  end

  get '/login' do
    erb :login
  end

  get '/home' do
    erb :home
  end

  get '/fail' do
    erb :fail
  end

  get '/listspace' do
    erb :listspace
  end

  post '/listspace' do
    Space.create(name: params[:name], description: params[:description], price: params[:price])
    redirect '/home'
  end

  post '/login/sign_up' do
    User.sign_up(su_password: params[:su_password], su_email: params[:su_email])
    redirect '/login'
  end

  post '/login/log_in' do
    result = User.log_in(li_email: params[:li_email], li_password: params[:li_password])
    if result == true
      redirect '/home'
    elsif result == false
      redirect '/fail'
    end
  end

  run! if app_file == $0
end
