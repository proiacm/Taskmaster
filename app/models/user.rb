class User < ActiveRecord::Base 
    has_many :appointmets 
    has_secure_password
    validates_presence_of :username, :email, :password
    validates_uniqueness_of :email
end