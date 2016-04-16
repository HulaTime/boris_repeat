require 'bike'

describe Bike do

  it { is_expected.to respond_to(:working?) }
  it { is_expected.to respond_to(:report_broken) }

  describe '#report_broken' do
    
    it 'sets the return value of #working? to false' do
      bike = Bike.new
      bike.report_broken
      expect(bike).to_not be_working
    end
  end
end