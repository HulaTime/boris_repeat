require 'van'

describe Van do
    
    it {is_expected.to respond_to(:take_broken_bikes).with(1).argument}
    
end