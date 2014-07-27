class Assignment < ActiveRecord::Base
  belongs_to :boat
  belongs_to :timeslot
end
