class User < ActiveRecord::Base
    has_secure_password #allows us to authenticate
    validates :name, presence: true
    validates :email, presence: true
    validates :email, uniqueness: true

    has_many :prayer_entries
    
end