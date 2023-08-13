class AddHabitIdToLogs < ActiveRecord::Migration[7.0]
  def change
    add_reference :logs, :habit, null: false, foreign_key: true
  end
end
