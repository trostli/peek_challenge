class CreateTimeslots < ActiveRecord::Migration
  def change
    create_table :timeslots do |t|
      t.timestamp :start_time
      t.integer :duration_in_minutes

      t.timestamps
    end
  end
end
