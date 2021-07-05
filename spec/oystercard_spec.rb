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
    oystercard.top_up(100)
    expect {oystercard.top_up 20 }.to raise_error "Your top up limit is £#{TOP_UP_LIMIT}."
  end
end