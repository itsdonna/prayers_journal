class UsersController < ApplicationController

    #create: login route -> login page
    get '/login'do
        erb :'/login'
    end

    #create session: find user, login
    #form action ->login (url), method ->post
    post "/login" do

        @user = User.find_by(email: params[:email])
        
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id #each user has a unique id to login
            #redirect to landing page
            puts session
            flash[:message] = "Welcome, #{@user.name}!"
            redirect "users/#{@user.id}"
        else
            flash[:errors] = "Email or Password is invalid. Please try again or sign up."
            redirect '/login'
        end
        
    end

    #create :signup route; renders signup form
    get '/signup' do
        erb :'/signup'
    end

    post '/users' do
        @user = User.new(params)
        if @user.save
        session[:user_id] = @user.id
        flash[:message] = "Welcome to Your Prayer Journal, #{@user.name}!"
        redirect "/users/#{@user.id}"
        
        else

            flash[:errors] = "Something went wrong. Failed to create account: #{@user.errors.full_messages.to_sentence}"
            redirect '/signup'
        end
    end

    get '/users/:id' do
        @user = User.find_by(id: params[:id])
        redirect_if_not_logged_in
        erb :'/users/show'
    end


    get '/logout' do
        session.clear
        redirect '/'
    end
end

    
