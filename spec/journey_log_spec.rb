require 'journey_log'
require 'oystercard'

describe JourneyLog do

  let(:entry_station){ double :entry_station }
  let(:exit_station){ double :exit_station }

    it 'records a journey' do
      expect(subject.journeys).to be_instance_of(Array)
    end

    it 'should store entry and exit stations' do
      subject.start(entry_station)
      expect(subject.journey_class.entry_station).to eq(entry_station)
      subject.finish(exit_station)
      expect(subject.journey_class.exit_station).to eq(exit_station)
    end

    it 'should have a record of the journey' do
      subject.start(entry_station)
      subject.finish(exit_station)
      expect(subject.journeys).to include{entry_station => exit_station }
    end

    it 'returns a penalty if no entry station'do
      subject.finish(exit_station)
      expect(subject.fare).to eq(Oystercard::PENALTY_FARE)
    end
end