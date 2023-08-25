class Log < ApplicationRecord
  belongs_to :habit

  before_create do |hc|
    hc.checks = {}.to_json
  end

  def add_day(date = Time.now)
    dh = DateHash.new(JSON.parse(self.checks))
    dh.add_date(date)
    self.checks = dh.date_hash.to_json
    self.save!
  end
end
