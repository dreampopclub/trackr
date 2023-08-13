class HabitCheck < ApplicationRecord
  belongs_to :habit

  before_create do |hc|
    hc.log = {}.to_json
  end

  def add_check(date = Time.now)
    log = Log.new(self.log)
    log.add(date)
    self.log = log.to_json
    self.save!
  end
end
