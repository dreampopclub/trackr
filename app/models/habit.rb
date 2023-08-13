class Habit < ApplicationRecord
  validates :name, presence: true
  has_one :habit_check, dependent: :destroy

  after_create do |habit|
    HabitCheck.new(habit: habit).save!
  end
end
