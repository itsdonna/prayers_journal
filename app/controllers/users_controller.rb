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
        end
        
    end

    #create :signup route
    get '/signup'do
        
    end

    get '/users/:id' do
        "show route"
    end

    

end