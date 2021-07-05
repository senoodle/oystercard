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
end