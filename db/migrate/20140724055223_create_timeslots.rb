class CreateTimeslots < ActiveRecord::Migration
  def change
    create_table :timeslots do |t|
      t.timestamp :start_time
      t.integer :duration_in_minutes
      t.integer :availability_count
      t.integer :customer_count

      t.timestamps
    end
  end
end
