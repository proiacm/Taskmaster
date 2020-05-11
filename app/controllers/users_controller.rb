class UsersController < ApplicationController 

      get '/signup' do 
        if logged_in?
          redirect '/appointments'
        end
          erb :'/users/new'
      end 
  
      post '/signup' do 
        unless params[:username] == "" || params[:email] == ""
          user = User.new(params)
          if user.save
              session[:user_id] = user.id
              redirect "/appointments"
          end
        end
          redirect "/signup"
      end

        # may or may not use
        # get '/users/:slug' do 
        #   @user = User.find {|u| u.slug == params[:slug]}
        #   erb :'/'
        # end
end