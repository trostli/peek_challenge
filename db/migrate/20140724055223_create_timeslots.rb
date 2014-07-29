class CreateTimeslots < ActiveRecord::Migration
  def change
    create_table :timeslots do |t|
      t.integer :start_time,     null: false
      t.integer :duration,       null: false
      t.integer :availability,   default: 0
      t.integer :customer_count, default: 0

      t.timestamps
    end
  end
end
