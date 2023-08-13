class DropHabitChecks < ActiveRecord::Migration[7.0]
  def change
    drop_table :habit_checks
  end
end
