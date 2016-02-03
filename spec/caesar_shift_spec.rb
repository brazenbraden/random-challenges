require_relative '../src/caesar_shift/caesar_shift'

describe CaesarShift do

  context "instanciating an instance of CaesarShift" do

    it "returns an instance" do
      caesar = CaesarShift.new
      expect(caesar).to be_an_instance_of(CaesarShift)
    end

    it "with a default rot of 6" do
      caesar = CaesarShift.new
      expect(caesar.rot).to eql(6)
    end

    it "has a custom rot of 13" do
      caesar = CaesarShift.new(13)
      expect(caesar.rot).to eql(13)
    end
  end


  # context "encrypting a string" do
  #   it "does a basic encrypt" do
  #
  #   end
  # end

end
