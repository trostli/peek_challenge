class Assignment < ActiveRecord::Base
  belongs_to :boat
  belongs_to :timeslot

  validates_uniqueness_of :boat_id, scope: :timeslot_id
  validates :boat_id, :timeslot_id, presence: true
end
