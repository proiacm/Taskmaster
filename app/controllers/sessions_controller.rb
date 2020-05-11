class SessionsController < ApplicationController

    get '/login' do 
        if logged_in?
          redirect '/appointments'
        end
          erb :'/sessions/login'
      end
  
      post '/login' do 
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect '/appointments'
        else 
          redirect '/login'
        end
      end

      get '/logout' do 
        if logged_in?
        session.clear 
        redirect '/login'
        else  
          redirect '/'
        end  
      end
end