require 'station'

describe Station do
  let(:station) { Station.new("name", 0) }

  it 'has a list of all stations and zones' do
    expect(station.name).to eq("name")
    expect(station.zone).to eq(0)
  end
  
end