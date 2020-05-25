class AppointmentsController < ApplicationController 

    get '/appointments' do
        if !logged_in?
            redirect '/login'
        end
            @appts = current_user.appointments
            @appts = @appts.order(date: :asc, time: :asc)
            erb :'/appointments/index'
    end

    get '/appointments/new' do 
        if !logged_in? 
            redirect '/login' 
        else
            erb :'appointments/new'
        end
    end 

    post '/appointments' do 
        @appt = current_user.appointments.build(params)
        if @appt
            if @appt.save
                redirect "/appointments/#{@appt.id}"
            else
                erb :'/appointments/new' #handle error messages
            end
        else
        redirect '/appointments/new'
        end
    end

    post '/appointments/search' do #search bar
        @appts = current_user.appointments.where(date: params[:date])
        @appts = @appts.order(date: :asc, time: :asc)
        erb :'/appointments/index' 
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
        if !@appt
            redirect '/appointments'
        end
            erb :'/appointments/edit'
    end 

    patch '/appointments/:id' do
        @appt = current_user.appointments.find_by_id(params[:id])
        if @appt
            if @appt.update(title: params[:title], date: params[:date], time: params[:time])
                redirect to "/appointments/#{@appt.id}"
            else
                erb :'/appointments/edit' #handle error messages
            end
        else
            redirect '/appointments'
        end 
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