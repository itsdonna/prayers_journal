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

    get 'prayer_entries/:id' do
        @prayer_entry = PrayerEntry.find(params[:id])
        erb :'/prayer_entries/show'
    end
end