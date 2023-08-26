class HabitsController < ActionController::Base
  def index
    @habits = Habit.includes(:log).all
  end
end
