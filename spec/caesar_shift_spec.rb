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

  context "encrypting a string" do

    it "throws an exception if no string is passed" do
      expect{CaesarShift.new().encrypt}.to raise_error(ArgumentError)
    end

    it "encrypts the alphabet using default rot of 6" do
      cypher = CaesarShift.new().encrypt("abcdefghijklmnopqrstuvwxyz")
      expect(cypher).to eql("ghijklmnopqrstuvwxyzabcdef")
    end

    it "encrypts 'Hello World!' using rot of 13" do
      cypher = CaesarShift.new(13).encrypt("Hello World!")
      expect(cypher).to eql("Uryyb Jbeyq!")
    end

  end

  context "decrypts a string" do
    it "throws an exception if no string is passed" do
      expect{CaesarShift.new().decrypt}.to raise_error(ArgumentError)
    end

    it "decrypts the alphabet using default rot of 6" do
      cypher = CaesarShift.new().decrypt("ghijklmnopqrstuvwxyzabcdef")
      expect(cypher).to eql("abcdefghijklmnopqrstuvwxyz")
    end

    it "decrypts 'Uryyb Jbeyq!' using rot of 13" do
      cypher = CaesarShift.new(13).decrypt("Uryyb Jbeyq!")
      expect(cypher).to eql("Hello World!")
    end
  end

end
