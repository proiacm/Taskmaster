class AppointmentsController < ApplicationController 

    get '/appointments' do 
        if !logged_in?
            redirect '/login'
        end
            @appts = current_user.appointments
            @appts = @appts.order(date: :asc)
            @appts = @appts.order(time: :asc)
            erb :'/appointments/index'
    end

    get '/appointments/new' do 
        if !logged_in? 
            redirect '/login' 
        else
            erb :'appointments/new'
        end
    end 

    post '/appointments/new' do
           @appt = current_user.appointments.build(params)
          if @appt.save
            redirect "/appointments/#{@appt.id}"
        end
        redirect '/appointments/new'
    end

    get '/appointments/:id' do 
        if !logged_in? 
            redirect '/login'
        end
            @appt = current_user.appointments.find_by_id(params[:id])
            erb :'/appointments/show'
    end 

    get '/appointments/:id/edit' do 
        if !logged_in?
            redirect '/login'
        end
        @appt = current_user.appointments.find_by_id(params[:id])
        if session[:user_id] != @appt[:user_id]
            redirect '/appointments'
        end
            erb :'/appointments/edit'
    end 

    patch '/appointments/:id' do 
        @appt = current_user.appointments.find_by_id(params[:id])
        if @appt
            @appt.update(title: params[:title], date: params[:date], time: params[:time])
            @appt.save
        end
        redirect to "/appointments/#{@appt.id}"
    end

    delete '/appointments/:id' do
        if !logged_in? 
            redirect '/login'
        end
        @appt = current_user.appointments.find_by_id(params[:id])
        if @appt 
            @appt.destroy 
        end
        redirect '/appointments'
    end
end