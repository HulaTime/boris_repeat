require 'van'
require 'docking_station'

describe Van do
  
  let(:bike) { double :bike, :working? => true }
  let(:bike1) { double :bike1, :working? => false }
  let(:bike2) { double :bike2, :working? => false }
  
  it {is_expected.to respond_to(:take_broken_bikes).with(1).argument}
    
  describe '#take_broken_bikes(station)' do
    
    it 'should take bikes from the docking station' do
        station = [bike, bike1, bike2]
        expect(subject.take_broken_bikes(station)).to include [bike1, bike2]
    end
  end
    
end