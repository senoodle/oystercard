require 'journey'
require 'station'

describe Journey do
  let(:journey) {Journey.new(entry_station)}
  let(:entry_station) { double :entry_station }
  let(:exit_station) { double :exit_station }

    it 'should store the entry station' do
      journey = Journey.new(entry_station)
      expect(journey.entry_station).to eq(entry_station)
    end

    it 'has a default fare of the penalty value' do
      journey = Journey.new(entry_station)
      expect(subject.fare).to eq(Oystercard::PENALTY_FARE)
    end
  
    it 'should store the journey when touching out' do
      journey = Journey.new(entry_station)
      journey.finish(exit_station)
      expect(journey.record).to include(entry_station => exit_station)
    end

    it 'charges the minimum fare' do
      journey = Journey.new(entry_station)
      journey.finish(exit_station)
      expect(journey.fare).to eq(Oystercard::MINIMUM_BALANCE)
    end
  end