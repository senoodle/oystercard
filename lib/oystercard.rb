require_relative 'station'
require_relative 'journey_log'
require_relative 'journey'

class Oystercard

  attr_reader :balance, :deduct
  attr_accessor :entry_station, :exit_station, :journeys

  TOP_UP_LIMIT = 90
  MINIMUM_BALANCE = 1
  PENALTY_FARE = 6

  def initialize
    @balance = 0
    @in_journey = false
    @journeys =[]
  end

  def top_up(money)
    raise "Your top up limit is £#{TOP_UP_LIMIT}." if @balance + money > TOP_UP_LIMIT
    @balance += money
  end

  def in_journey?
    @journey_log.journey?
  end

  def touch_in(entry_station)
    raise "You have insufficient funds." if balance < MINIMUM_BALANCE
    deduct(@current_journey.fare) if @current_journey
    @current_journey = Journey.new(entry_station)
  end

  def touch_out(exit_station)
    @journey_log.finish(exit_station)
    deduct(@journey_log.fare)
    @journey_log.complete?
  end

  def journey_history
    @journey_log.journeys
  end

  private

  def deduct(fare)
    @balance -= fare
  end
  
end