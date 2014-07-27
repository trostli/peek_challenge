class Timeslot < ActiveRecord::Base
  has_many :bookings
  has_many :assignments
  has_many :boats, through: :assignments

  validates :start_time, :duration_in_minutes, presence: true, numericality: { only_integer: true, greater_than: 0 }

end
