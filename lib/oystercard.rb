class Oystercard

  attr_reader :balance

  TOP_UP_LIMIT = 90
  MINIMUM_BALANCE = 1

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(money)
    fail "Your top up limit is £#{TOP_UP_LIMIT}." if @balance + money > TOP_UP_LIMIT
    @balance += money

  end

  def deduct(fare)
    @balance -= fare
  end

  def touch_in(entry_station)
  fail "You have insufficient funds." if balance < MINIMUM_BALANCE
   entry_station
   @in_journey = true
  end

  def in_journey?
    @in_journey 
  end

  def touch_out
    @in_journey = false
  end
  
end