class User < ActiveRecord::Base 
    has_many :appointmets 
    has_secure_password 

    def slug
        user = User.find_by_id(id)
        user.username.downcase.gsub(" ", "-")
        end
     
         def self.find_by_slug(slug)
         User.find{|user| user.slug == slug}
        end
end