class UsersController < ApplicationController 

      get '/signup' do 
        if logged_in?
          redirect '/appointments'
        end
          erb :'/users/new'
      end 
  
      post '/signup' do 
        unless params[:username] == "" || params[:email] == ""
          user = User.new(username: params[:username], email: params[:email], password: params[:password])
          if user.save
              session[:user_id] = user[:id]
              redirect "/appointments"
          end
        end
          redirect "/signup"
      end
end