class Oystercard

  attr_reader :balance

  TOP_UP_LIMIT = 90

  def initialize
    @balance = 0
    @in_use = false
  end

  def top_up(money)
    fail "Your top up limit is £#{TOP_UP_LIMIT}." if @balance + money > TOP_UP_LIMIT
    
    @balance += money

  end

  def deduct(fare)
    @balance -= fare
  end

  def touch_in(entry_station)
   entry_station
   @in_use = true
  end

  def in_journey?
    @in_use 
  end

  def touch_out
    @in_use = false
  end
  
end