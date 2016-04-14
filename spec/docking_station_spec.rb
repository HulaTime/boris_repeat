require 'docking_station'

describe DockingStation do

  it 'should respond to #release_bike' do
    expect(subject).to respond_to :release_bike
  end
  it { is_expected.to respond_to(:dock).with(1).argument }
  it { is_expected.to respond_to(:bike) }

  it '#release_bike should give a bike' do
    bike = subject.release_bike
    expect(bike.working?).to be_truthy
  end

  it '#dock(bike) should return value of the bike docked' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq(bike)
  end

  it '#bike should return the docked bike' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq(subject.bike)
  end

end