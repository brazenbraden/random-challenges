require_relative '../../src/temperature_converter/temperature'

describe Temperature do
  context "instantiating" do
    it "it is instantiable" do
      expect(Temperature.new 100, :c).to be_an_instance_of Temperature
    end

    it "it represents a temperature" do
      temp = Temperature.new 100, :c
      expect(temp.value).to be 100
      expect(temp.unit).to be :c
    end

    it "it supports valid units" do
      expect(Temperature.new 100, :c).to be_an_instance_of Temperature
      expect(Temperature.new 100, :f).to be_an_instance_of Temperature
      expect(Temperature.new 100, :k).to be_an_instance_of Temperature
    end

    it "it rejects invalid units" do
      expect{Temperature.new 100, :a}.to raise_error ArgumentError
    end
  end

  context "converting" do
    it "it rejects invalid units" do
      temp = Temperature.new 100, :c
      expect{temp.to :a}.to raise_error ArgumentError
    end

    it "returns the same value if the unit does not change" do
      expect( (Temperature.new 100, :k).to :k ).to be 100
      expect( (Temperature.new 100, :c).to :c ).to be 100
      expect( (Temperature.new 100, :f).to :f ).to be 100
    end

    context "convert kelvin" do
      before :all do
        @temp = Temperature.new 100, :k
      end

      it "converts k to c" do
        expect(@temp.to :c).to be -173.15
      end

      it "converts k to f" do
        expect(@temp.to :f).to be -279.67
      end
    end

    context "convert celsius" do
      before :all do
        @temp = Temperature.new 100, :c
      end

      it "converts c to k" do
        expect(@temp.to :k).to be 373.15
      end

      it "converts c to f" do
        expect(@temp.to :f).to be 212.0
      end
    end

    context "convert fahrenheit" do
      before :all do
        @temp = Temperature.new 100, :f
      end

      it "converts f to k" do
        expect(@temp.to :k).to be 310.93
      end

      it "converts f to c" do
        expect(@temp.to :c).to be 37.78
      end
    end
  end
end
