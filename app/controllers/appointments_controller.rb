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
    end 

    get '/appointments/:id/edit' do 
    end 

    patch '/appointments/:id' do 
    end

    delete '/appointments/:id' do 
    end
end