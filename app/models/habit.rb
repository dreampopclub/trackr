class Habit < ApplicationRecord
  validates :name, presence: true
  has_one :habit_check, dependent: :destroy

  delegate :add_check, to: :habit_check

  after_create do |habit|
    HabitCheck.new(habit: habit).save!
  end

  def log
    JSON.parse(self.habit_check.log)
  end
end
