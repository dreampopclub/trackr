class Log < ApplicationRecord
  belongs_to :habit

  before_create do |hc|
    hc.checks = {}.to_json
  end

  def add(date = Time.now)
    self.checks = adder(date).to_json
    self.save!
  end

  def foo(boo)
    debugger
    puts boo
  end

  private def adder(date)
    obj = JSON.parse(self.checks)
    if obj[date.year.to_s]
      if obj[date.year.to_s][date.month.to_s]
        if obj[date.year.to_s][date.month.to_s][date.day.to_s]
          raise StandardError, 'day already logged'
        else
          obj[date.year.to_s][date.month.to_s][date.day.to_s] => true
        end
      else
        obj[date.year.to_s] = { date.month.to_s => { date.day.to_s => true }}
      end
    else
      obj[date.year.to_s] = { date.month.to_s => { date.day.to_s => true }}
    end
    obj
  end
end
