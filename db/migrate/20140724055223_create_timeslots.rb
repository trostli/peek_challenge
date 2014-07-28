class CreateTimeslots < ActiveRecord::Migration
  def change
    create_table :timeslots do |t|
      t.timestamp :start_time,  null: false
      t.integer :duration,      null: false
      t.integer :availability_count,  default: 0
      t.integer :customer_count,      default: 0

      t.timestamps
    end
  end
end
