class UsersController < ApplicationController 

      get '/signup' do 
        if logged_in?
          redirect '/appointments'
        end
          erb :'/users/new'
      end 
  
      post '/signup' do 
          user = User.new(params)
          if user.save
              session[:user_id] = user[:id]
              redirect "/appointments"
          end
          redirect "/signup"
      end
end