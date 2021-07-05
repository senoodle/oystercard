class Oystercard

  attr_reader :balance

  TOP_UP_LIMIT = 90

  def initialize
    @balance = 0
  end

  def top_up(money)
    fail "Your top up limit is £#{TOP_UP_LIMIT}." if @balance + money > TOP_UP_LIMIT
    
    @balance += money

  end

end