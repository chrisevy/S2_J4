require_relative '../lib/00_trader'
describe "perform ? method" do
    it "returns an array of hash" do
        expect(perform).not_to be_nil
    end
end

def  crypto_valide?(monnaie)
    a=false
    perform.map{|i| if i.keys==[monnaie] then a=true end }
    return a
  end
  
  describe "test if main currency are there" do
    it "should return BTC" do    
      expect(crypto_valide?("BTC")).to be true
    end
  end
  
  describe "test if main currency are there" do
    it "should return ETH" do    
      expect(crypto_valide?("ETH")).to be true
    end
  end
  
  describe "test if main currency are there" do
    it "should return XRP" do    
      expect(crypto_valide?("XRP")).to be true
    end
  end

end


