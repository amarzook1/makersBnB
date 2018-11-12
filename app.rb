require 'sinatra/base'
require './lib/user'

class Makersbnb < Sinatra::Base

  get '/login' do
    erb :login
  end

  get '/home' do
    erb :home
  end

  get '/fail' do
    erb :fail
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