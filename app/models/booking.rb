class Booking < ActiveRecord::Base
  belongs_to :timeslot

  validates :size, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
