class AppointmentsController < ApplicationController 

    get '/appointments' do #index route
        if !logged_in?
            redirect '/login'
        end
            @appts = current_user.appointments
            @appts = @appts.order(date: :asc, time: :asc)
            erb :'/appointments/index'
    end

    get '/appointments/new' do #new route
        if !logged_in? 
            redirect '/login' 
        else
            erb :'appointments/new'
        end
    end 

    post '/appointments' do #create route
        @appt = current_user.appointments.build(params)
        if @appt
            if @appt.save
                redirect "/appointments/#{@appt.id}"
            else 
                #handle error messages
                erb :'/appointments/new'
            end
        else
        redirect '/appointments/new'
        end
    end

    get '/appointments/:id' do #show route
        if !logged_in? 
            redirect '/login'
        end
            @appt = current_user.appointments.find_by_id(params[:id])
            erb :'/appointments/show'
    end 

    get '/appointments/:id/edit' do #edit route
        if !logged_in?
            redirect '/login'
        end
        @appt = current_user.appointments.find_by_id(params[:id])
        if !@appt
            redirect '/appointments'
        end
            erb :'/appointments/edit'
    end 

    patch '/appointments/:id' do #update route
        @appt = current_user.appointments.find_by_id(params[:id])
        if @appt
            if @appt.update(title: params[:title], date: params[:date], time: params[:time])
                redirect to "/appointments/#{@appt.id}"
            else
                #handle error messages
                erb :'/appointments/edit'
            end
        else
            redirect '/appointments'
        end 
    end

    delete '/appointments/:id' do #destroy route
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