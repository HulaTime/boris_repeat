require 'docking_station'

describe DockingStation do

  it 'should respond to #release_bike' do
    expect(subject).to respond_to :release_bike
  end

  it { is_expected.to respond_to(:dock).with(1).argument }
  it { is_expected.to respond_to(:bikes) }

  it '#bikes should return the docked bikes' do
    expect(subject.dock(Bike.new)).to eq(subject.bikes)
  end

  describe '#release_bike'do
    it 'should give a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq(bike)
    end

    it 'should raise an error when no bikes are available' do
      expect {subject.release_bike}.to raise_error 'no bikes available'
    end

  end

  describe '#dock' do
    it 'should raise an error if the docking station is full' do
      
      # bike = Bike.new     # these lines are unnecessary since
      # bike2 = Bike.new    # we can just put Bike.new as both parameters
      #subject.dock(Bike.new)
      #expect { subject.dock(Bike.new) }.to raise_error 'docking station is full'
      # above test becomes redundant now that we want a greater capacity
      
      20.times { subject.dock(Bike.new ) }
      expect { subject.dock(Bike.new) }.to raise_error 'station at capacity'
    end

    it 'should return value of the bike passed as an argument' do
      bike = Bike.new
      expect((subject.dock bike).last).to eq(subject.release_bike)
    end
  end

end