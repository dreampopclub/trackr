class DateHash
  def initialize(date_hash ={}.to_json)
    @date = JSON.parse(date_hash)
  end

  def add_date(date = Time.now)
    if @date[date.year.to_s]
      if @date[date.year.to_s][date.month.to_s]
        if @date[date.year.to_s][date.month.to_s][date.day.to_s]
          raise StandardError, 'day already logged'
        end
        @date[date.year.to_s][date.month.to_s][date.day.to_s] = true
        
      end
      @date[date.year.to_s][date.month.to_s] = { date.day.to_s => true }
    end
    @date[date.year.to_s] = { date.month.to_s => { date.day.to_s => true }}
  end
end
