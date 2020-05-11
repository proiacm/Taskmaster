class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :title 
      t.datetime :date
      t.datetime :time
      t.integer :user_id 
    end
  end
end
