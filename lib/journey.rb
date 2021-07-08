require_relative 'oystercard'
require_relative 'journey_log'
require_relative 'station'

class Journey
  attr_reader :entry_station, :exit_station

  def initialize(entry_station = nil)
    @entry_station = entry_station
    @exit_station
    @fare = 1

  end

  def finish(exit_station)
    @exit_station = exit_station
  end

  def fare
    @entry_station && @exit_station ? Oystercard::MINIMUM_BALANCE : Oystercard::PENALTY_FARE
  end

  def record
    { entry_station => exit_station }
  end
end

