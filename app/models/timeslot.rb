class Timeslot < ApplicationRecord
    belongs_to :user

    validates_presence_of :activity, :booked_time, :user_id
end
