class AddHabitChecks < ActiveRecord::Migration[7.0]
  def change
    create_table :habit_checks do |t|
      t.timestamps
    end
  end
end
