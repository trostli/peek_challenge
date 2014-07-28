class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.belongs_to :boat
      t.belongs_to :timeslot

      t.timestamps
    end
  end
end
