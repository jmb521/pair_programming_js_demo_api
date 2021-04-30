class CreateTimeslots < ActiveRecord::Migration[6.1]
  def change
    create_table :timeslots do |t|
      t.string :activity
      t.datetime :booked_time
      t.string :booked_email
      t.boolean :taken, default: false
      t.belongs_to :user
      t.timestamps
    end
  end
end
