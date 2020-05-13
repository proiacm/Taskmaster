class Appointment < ActiveRecord::Base 
    belongs_to :user

    # def slug
    #     appt = Appointment.find_by_id(id)
    #     appt.title.downcase.gsub(" ", "-")
    #     end
     
    #      def self.find_by_slug(slug)
    #      Appointment.find{|appt| appt.slug == slug}
    #     end
end