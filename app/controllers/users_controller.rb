class UsersController < ApplicationController

    #create: login route -> login page
    get '/login'do
       erb :login
    end

    #create session: find user, login
    #form action ->login (url), method ->post
    post '/login' do

        @user = User.find_by(email: params[:email])
        
        if @user.authenticate(params[:password])
            session[:user_id] = @user.id #each user has a unique id to login
            #redirect to landing page
            puts session
            redirect "users/#{@user.id}"
        else
            redirect '/login'
        end
        
    end

    #create :signup route; renders signup form
    get '/signup' do
        erb :signup
    end

    post '/users' do
        if params[:name] != "" && params[:password] !=""
        @user = User.create(params)
        session[:user_id] = @user.id
        redirect "/users/#{@user.id}"
        
        else
            redirect '/signup'
        end
    end

    get '/users/:id' do
        @user = User.find_by(id: params[:id])
        erb :'/users/show'
    end


    get '/logout' do
        session.clear
        redirect '/'
    end
end

    
