class AppointmentsController < ApplicationController 

    get '/appointments' do 
        @appt = Appointment.all
        erb :'/appointments/index'
    end

    get '/appointments/new' do 
    end 

    post '/appointments' do
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