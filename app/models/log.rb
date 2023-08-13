class Log
  def initialize(log)
    @log = JSON.parse(log)
  end

  def add(date)
    if @log[date.year.to_s]
      if @log[date.year.to_s][date.month.to_s]
        @log[date.year.to_s][date.month.to_s] << date.day.to_s
      else
        @log[date.year.to_s] = { date.month.to_s => [date.day.to_s] }
      end
    else
      @log[date.year.to_s] = { date.month.to_s => [date.day.to_s] }
    end
  end

  def to_json
    @log.to_json
  end
end
