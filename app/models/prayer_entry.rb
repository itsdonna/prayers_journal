class PrayerEntry < ActiveRecord::Base

    belongs_to :user

    def formatted_created_at
        self.created_at.strftime("%a, %d %b %Y")
    end
    
end
