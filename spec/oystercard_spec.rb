require 'oystercard'
require 'journey'
require 'journey_log'
require 'station'

describe Oystercard do
  let(:oystercard) { Oystercard.new }
  let(:entry_station) { double :station}
  let(:exit_station) { double :station}

  it 'has a balance' do
    expect(oystercard).to respond_to(:balance)
  end

  it 'has a default balance of 0' do
    expect(oystercard.balance).to eq(0)
  end

  it 'increases the balance by the top-up value' do
    oystercard.top_up(10)
    expect(oystercard.balance).to eq(10)
  end

  it 'shouldnt exceed maximum top up' do
    oystercard.top_up(80)
    expect {oystercard.top_up 20 }.to raise_error "Your top up limit is £#{Oystercard::TOP_UP_LIMIT}."
  end

  it 'should allow touch in' do 
    expect(oystercard).to respond_to(:touch_in).with(1).argument
  end

  it 'should check in_journey?' do
    oystercard.top_up(Oystercard::MINIMUM_BALANCE)
    oystercard.touch_in('Bank')
    expect(oystercard).to respond_to :in_journey?
  end

  it 'allows us to touch out' do 
    oystercard.top_up(Oystercard::MINIMUM_BALANCE)
    oystercard.touch_in('Holborn')
    expect(oystercard).to respond_to :touch_out
  end

  it 'shouldnt exceed maximum top up' do
    expect {oystercard.touch_in("Brixton") }.to raise_error "You have insufficient funds."
  end

  # it 'charges the card on touch out' do
  #   oystercard.top_up(20)
  #   oystercard.touch_in('Holborn')
  #   expect {oystercard.touch_out('Stratford')}.to change{oystercard.balance}.by(-Oystercard::MINIMUM_BALANCE)
  # end

  # it 'stores the exit station' do
  #   oystercard.top_up(20)
  #   oystercard.touch_in(entry_station)
  #   oystercard.touch_out(exit_station)
  #   expect(oystercard.exit_station).to eq exit_station
  # end

  it 'checks journeys array is empty' do
    expect(oystercard.journeys).to be_empty
  end

end