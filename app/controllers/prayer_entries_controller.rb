class PrayerEntriesController < ApplicationController

    # read route
    get '/prayer_entries' do
        @prayer_entries = PrayerEntry.all
        erb :'prayer_entries/index'
    end
    
    #create: render new form for new entry
    get '/prayer_entries/new' do
        erb :'/prayer_entries/new'
    end

    #create route
    post '/prayer_entries' do
        #create new entry
        #save entry
        redirect_if_not_logged_in
        if params[:content] != ""

            @prayer_entry = PrayerEntry.create(content: params[:content], user_id: current_user.id, title: params[:title])
            
            flash[:message] = "New Prayer successfully created."
            redirect "/prayer_entries/#{@prayer_entry.id}"
        else
            flash[:message] = "Message cannot be empty."
            redirect '/prayer_entries/new'
        end
    end
    
    #show route
    get '/prayer_entries/:id' do
        set_prayer_entry
        erb :'/prayer_entries/show'
    end
    
    # Update route to edit erb to render edit form
    get '/prayer_entries/:id/edit' do
        redirect_if_not_logged_in
        set_prayer_entry
    
        if authorized_to_edit?(@prayer_entry)
            erb :'/prayer_entries/edit'
        else
            redirect "users/#{current_user.id}"
        end
    end
    
    # update route
    patch '/prayer_entries/:id' do
        redirect_if_not_logged_in
        set_prayer_entry
        
        if @prayer_entry.user == current_user && params[:content] != ""
            @prayer_entry.update(content: params[:content])
            redirect "/prayer_entries/#{@prayer_entry.id}"
        else
            redirect "users/#{current_user.id}"
        end
    end

    # destroy route
    delete '/prayer_entries/:id' do
        set_prayer_entry
        if authorized_to_edit?(@prayer_entry)
            @prayer_entry.destroy
            flash[:message] = "Successfully delete that entry."
            redirect '/prayer_entries'
        else
            redirect '/prayer_entries'
        end
    end
    
    private
    
    def set_prayer_entry
        @prayer_entry = PrayerEntry.find(params[:id])
    end
end