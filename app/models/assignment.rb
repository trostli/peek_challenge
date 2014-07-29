class Assignment < ActiveRecord::Base
  belongs_to :boat
  belongs_to :timeslot

  validates :boat, uniqueness: { scope: :timeslot }
  validates :boat, :timeslot, presence: true
end
