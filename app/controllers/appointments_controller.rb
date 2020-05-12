class AppointmentsController < ApplicationController 

    get '/appointments' do 
        @user = current_user
        if !logged_in?
            redirect '/login'
        else
            @appts = Appointment.all
            erb :'/appointments/index'
        end
    end

    get '/appointments/new' do 
        if !logged_in? 
            redirect '/login' 
        else
            erb :'appointments/new'
        end
    end 

    post '/appointments/new' do
        unless params[:title] == "" && params[:date] == "" && params[:time] == ""
            @appt = Appointment.new(id: params[:id], title: params[:title], date: params[:date], time: params[:time])
            @appt[:user_id] = session[:user_id]
            @appt.save
            redirect "/appointments/#{@appt.id}"
        end
            redirect '/appointments/new'
    end

    get '/appointments/:id' do 
        @appt = Appointment.find_by_id(params[:id])
        if !logged_in? 
            redirect '/login'
        end
            erb :'/appointments/show'
    end 

    get '/appointments/:id/edit' do 
        if !logged_in?
            redirect '/login'
        end
        @appt = Appointment.find_by_id(params[:id])
        if session[:user_id] != @appt[:user_id]
            redirect '/appointments'
        end
            erb :'/appointments/edit'
    end 

    patch '/appointments/:id' do 
        @appt = Appointment.find_by_id(params[:id])
        if params[:title].empty? && params[:date].empty? && params[:time].empty?
          redirect to "/tweets/#{@appt.id}/edit"
        end
        if session[:user_id] = @appt.user_id
        @appt.update(title: params[:title], date: params[:date], time: params[:time])
        @appt.save
        end
        redirect to "/appointments/#{@appt.id}"
    end

    delete '/appointments/:id' do
        if !logged_in? 
            redirect '/login'
        end
        @appt = Appointment.find_by_id(params[:id])
        if session[:user_id ] != @appt[:user_id] 
            redirect '/appointments'
        end
        @appt.destroy 
        redirect '/appointments'
    end
end