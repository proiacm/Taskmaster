class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :title 
      t.string :date
      t.string :time
      t.integer :user_id 
    end
  end
end
