class Habit < ApplicationRecord
  validates :name, presence: true
  has_one :log, dependent: :destroy

  after_create do |habit|
    Log.new(habit: habit).save!
  end

  def log
    JSON.parse(self.habit_check.log)
  end
end