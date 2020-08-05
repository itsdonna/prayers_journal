class PrayerEntriesController < ApplicationController

    get '/prayer_entries/new' do
        erb :'/prayer_entries/new'
    end

    post '/prayer_entries' do
        #create new entry
        #save entry
        if !logged_in?
            redirect '/'
        end
        if params[:content] != ""
            @prayer_entry = PrayerEntry.create(content: params[:content], user_id: current_user.id)

            redirect "/prayer_entries/#{@prayer_entry.id}"
        else
            redirect '/prayer_entries/new'
        end
    end
    
    #show route
    get '/prayer_entries/:id' do
        set_prayer_entry
        erb :'/prayer_entries/show'
    end
    
    #route to edit erb to render edit form
    get '/prayer_entries/:id/edit' do
        set_prayer_entry
        if logged_in?
            if @prayer_entry.user == current_user
                erb :'/prayer_entries/edit'
            else
                redirect "users/#{current_user.id}"
            end
        else
            redirect '/'
        end
    end
    
    patch '/prayer_entries/:id' do
        set_prayer_entry
        if logged_in?
            if @prayer_entry.user == current_user
                @prayer_entry.update(content: params[:content])
                redirect "/prayer_entries/#{@prayer_entry.id}"
            else
                redirect "users/#{current_user.id}"
            end
        else
            redirect '/'
        end
    end
    
    private
    
    def set_prayer_entry
        @prayer_entry = PrayerEntry.find(params[:id])
    end
end