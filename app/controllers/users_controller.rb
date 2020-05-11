class UsersController < ApplicationController 

    get '/login' do 
        if logged_in?
          redirect '/appointments'
        end
          erb :'/users/login'
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
  
      get '/signup' do 
        if logged_in?
          redirect '/appointments'
        end
          erb :'/users/signup'
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
  
      get '/logout' do 
          if logged_in?
          session.clear 
          redirect '/login'
          else  
            redirect '/'
          end  
        end
  
        get '/users/:slug' do 
          @user = User.find {|u| u.slug == params[:slug]}
          erb :'/users/show'
        end
end