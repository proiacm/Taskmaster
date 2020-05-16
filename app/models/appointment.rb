class Appointment < ActiveRecord::Base 
    belongs_to :user
    validates_presence_of :title, :date, :time
    validates :date && :time, uniqueness: { scope: :user_id }
end