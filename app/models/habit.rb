class Habit < ApplicationRecord
  validates :name, presence: true
  has_one :log, dependent: :destroy

  delegate :add_day, to: :log

  after_create do |habit|
    Log.new(habit: habit).save!
  end
end
