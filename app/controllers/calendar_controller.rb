class CalendarController < ActionController::Base
  def this_month
    @habits = Habit.includes(:log).all
    today = Date.today
    @days = today.all_month.map { |day| day.day }
  end
end
