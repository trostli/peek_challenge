class Timeslot < ActiveRecord::Base
  has_many  :bookings
  has_many :assignments, inverse_of: :timeslot, dependent: :destroy
  has_many :boats, through: :assignments

  validates :start_time, :duration, presence: true, numericality: { only_integer: true, greater_than: 0 }

  def as_json(options={})
    json = super( include: { boats: { only: :id } }, except: [:created_at, :updated_at] )
    json["boats"].map! { |boat_id| boat_id = boat_id.values[0] }
    json
  end

end
