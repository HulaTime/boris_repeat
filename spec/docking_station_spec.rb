require 'docking_station'

describe DockingStation do
  
  let(:bike) {double :bike}
  
  it 'has a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end
  
  it 'should respond to #release_bike' do
    expect(subject).to respond_to :release_bike
  end
  
  describe 'initialization' do
    it 'has a variable capacity' do
      docking_station = DockingStation.new(50)
      50.times { docking_station.dock(bike) }  
      expect{ docking_station.dock(bike) }.to raise_error 'station at capacity'  #dependecy
    end
  end

  it { is_expected.to respond_to(:dock).with(1).argument }
  
  # it { is_expected.to respond_to(:bikes) }
                                                                #bikes is now a private reader
  #it '#bikes should return the docked bikes' do
  #  expect(subject.dock(Bike.new)).to eq(subject.bikes)
  #end

  describe '#release_bike'do
    it 'should give a working bike' do
      allow(bike).to receive(:working?).and_return(true)
      subject.dock(bike)
      expect(subject.release_bike).to eq(bike)
    end

    it 'should raise an error when no bikes are available' do
      expect {subject.release_bike}.to raise_error 'no bikes available'
    end
    
    it 'should not release broken bikes' do
      allow(bike).to receive(:working?).and_return(false)
      subject.dock(bike)
      expect { subject.release_bike }.to raise_error 'bike is broken'
    end

  end

  describe '#dock' do
    it 'should raise an error if the docking station is full' do
      
      # bike = Bike.new     # these lines are unnecessary since
      # bike2 = Bike.new    # we can just put Bike.new as both parameters
      #subject.dock(Bike.new)
      #expect { subject.dock(Bike.new) }.to raise_error 'docking station is full'
      # above test becomes redundant now that we want a greater capacity
      
      subject.capacity.times { subject.dock(bike) }  #dependecy
      expect { subject.dock(bike) }.to raise_error 'station at capacity'  
    end

    it 'should return value of the bike passed as an argument' do   
      expect((subject.dock(bike)).last).to eq(bike)
    end
  end

end