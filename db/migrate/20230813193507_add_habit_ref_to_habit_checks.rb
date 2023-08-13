class AddHabitRefToHabitChecks < ActiveRecord::Migration[7.0]
  def change
    add_reference :habit_checks, :habit, null: false, foreign_key: true
  end
end
