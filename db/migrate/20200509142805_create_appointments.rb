class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :title 
      t.       :date #-- t.date?
      t.       :time #-- t.time?
      t.integer :user_id 
  end
end
