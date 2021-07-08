require_relative 'journey'
require_relative 'oystercard'
require_relative 'station'


class JourneyLog

  attr_reader :journeys, :journey, :journey_class

  def initialize(journey = nil)
    @journey_class = journey_class
    @journeys = []
  end

  def start(entry_station)
    @journey_class = Journey.new(entry_station)
  end

  def finish(exit_station)
    current_journey
    @journey_class.finish(exit_station)
    update_journey_log
  end

  def fare 
    @journey_class.fare
  end

  def journey?
    !@journey_class.nil?
  end

  def current_journey
    @journey_class || @journey_class = Journey.new
  end
  
  def update_journey_log
    @journeys << journey_class.record
  end

  def complete?
    @journey_class = nil
  end

  end

  