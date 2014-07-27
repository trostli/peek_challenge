class Boat < ActiveRecord::Base
  has_many :assignments
  has_many :timeslots, through: :assignments

  validates :name, presence: true, uniqueness: true
  validates :capacity, presence: true, numericality: { only_integer: true, greater_than: 0 }

end
