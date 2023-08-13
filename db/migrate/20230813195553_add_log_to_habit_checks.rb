class AddLogToHabitChecks < ActiveRecord::Migration[7.0]
  def change
    add_column :habit_checks, :log, :json
  end
end
