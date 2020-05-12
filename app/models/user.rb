class User < ActiveRecord::Base 
    has_many :appointmets 
    has_secure_password
end