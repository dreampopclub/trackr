class Log < ApplicationRecord
  belongs_to :habit

  before_create do |hc|
    hc.log = {}.to_json
  end

  def add(date = Time.now)
    self.log = adder(date).to_json
    self.save!
  end

  private def adder(date)
    if self[date.year.to_s]
      if self[date.year.to_s][date.month.to_s]
        if self[date.year.to_s][date.month.to_s][date.day.to_s]
          raise StandardError, 'day already logged'
        else
          self[date.year.to_s][date.month.to_s][date.day.to_s] => true
        end
      else
        self[date.year.to_s] = { date.month.to_s => { date.day.to_s => true }}
      end
    else
      self[date.year.to_s] = { date.month.to_s => { date.day.to_s => true }}
    end
  end
end
