require_relative "../lib/01_mairie"

describe "perform ? method" do
    it "returns an array of hash" do
        expect(perform).not_to be_nil
    end
end

def  mairie_valide?(ville)
    a=false
    perform.map{|i| if i.keys==[ville] then a=true end }
    return a
end

describe "test if main town are there" do
    it "should return CERGY" do
        expect(mairie_valide?("CERGY")).to be true
    end
end   
describe "test if main town are there" do
    it "should return SARCELLES" do
        expect(mairie_valide?("SARCELLES")).to be true
    end
    
end
describe "test if main town are there" do
    it "should return US" do
        expect(mairie_valide?("US")).to be true
    end
end    
describe "check if return all the cities" do
    it "should return 185" do
        expect(perform.count).to eq(185)
    end  
end