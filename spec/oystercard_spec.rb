require 'oystercard'

describe Oystercard do
  let(:oystercard) { Oystercard.new }
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

  it 'should deduct fare from balance' do 
    oystercard.top_up(40)
    oystercard.deduct(10)
    expect(oystercard.balance).to eq(30)
  end

  it 'should allow touch in' do 
    expect(oystercard).to respond_to(:touch_in).with(1).argument
  end

  it 'should check in_journey?' do
    oystercard.touch_in('Bank')
    expect(oystercard).to respond_to :in_journey?
  end

  it 'checks the card is in use' do
    oystercard.touch_in('Camden')
    expect(oystercard.in_journey?).to eq true 
  end

  it 'allows us to touch out' do 
    oystercard.touch_in('Holborn')
    expect(oystercard).to respond_to :touch_out
  end

end