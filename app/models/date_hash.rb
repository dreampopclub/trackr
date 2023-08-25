class DateHash
  def date_hash
    @date_hash ||= {}
  end

  def add_date(date = Date.today)
    if date_hash[date.year.to_s]
      if date_hash[date.year.to_s][date.month.to_s]
        if date_hash[date.year.to_s][date.month.to_s][date.day.to_s]
          raise StandardError, 'day already logged'
        end
        date_hash[date.year.to_s][date.month.to_s][date.day.to_s] = true
      end
    else
      date_hash[date.year.to_s] = {}
      date_hash[date.year.to_s][date.month.to_s] = { date.day.to_s => true }
    end
    date_hash
  end
end
