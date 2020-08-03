class PrayerEntriesController < ApplicationController

    get '/prayer_entries/new' do
        erb :'/prayer_entries/new'
    end

    post '/prayer_entries' do
        
    end
end