class User < ActiveRecord::Base
    has_secure_password #allows us to authenticate
end