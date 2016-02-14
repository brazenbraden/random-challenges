require_relative '../../src/temperature_converter/temperature_converter'

describe TemperatureConverter do
  context "initializes a new instance" do
    before :each do
      @temp = TemperatureConverter.new
    end

    it "returns an instance" do
      expect(@temp).to be_an_instance_of(TemperatureConverter)
    end

    it "should have a default input of celsius" do
      expect(@temp.in).to eql('celsius')
    end

    it "should have a default output of fahrenheit" do
      temp = TemperatureConverter.new
      expect(@temp.out).to eql('fahrenheit')
    end
  end

  it "convert to throw an ArgumentError if no temperature is given" do
    temp = TemperatureConverter.new
    expect(temp.convert).to raise_error(ArgumentError)
  end

  context "converts celsius temperatures" do
      it "converts 0 celsius to 0 celsius" do
      temp = TemperatureConverter.new(input_scale: 'celsius', output_scale: 'celsius')
      expect(temp.convert(0)).to eql(0.00)
    end

    it "converts 0 celsius to 273.15 kelvin" do
      temp = TemperatureConverter.new(input_scale: 'celsius', output_scale: 'kelvin')
      expect(temp.convert(0)).to eql(273.15)
    end

    it "converts 0 celsius to 32.0 fahrenheit" do
      temp = TemperatureConverter.new
      expect(temp.convert(0)).to eql(32.00)
    end
  end

  context "converts fahrenheit temperatures" do
    it "converts 0 fahrenheit to 0 fahrenheit" do
      temp = TemperatureConverter.new(input_scale: 'fahrenheit', output_scale: 'fahrenheit')
      expect(temp.convert(0)).to eql(0.00)
    end

    it "converts 0 fahrenheit to -17.7778 celsius" do
      temp = TemperatureConverter.new(input_scale: 'fahrenheit', output_scale: 'celsius')
      expect(temp.convert(0)).to eql(-17.78)
    end

    it "converts 0 fahrenheit to 255.37 kelvin" do
      temp = TemperatureConverter.new(input_scale: 'fahrenheit', output_scale: 'kelvin')
      expect(temp.convert(0)).to eql(255.37)
    end
  end

  context "converts kelvin temperatures" do
    it "converts 0 kelvin to 0 kelvin" do
      temp = TemperatureConverter.new(input_scale: 'kelvin', output_scale: 'kelvin')
      expect(temp.convert(0)).to eql(0.00)
    end

    it "converts 0 kelvin to -273.158 celsius" do
      temp = TemperatureConverter.new(input_scale: 'kelvin', output_scale: 'celsius')
      expect(temp.convert(0)).to eql(-273.15)
    end

    it "converts 0 kelvin to -459.67 fahrenheit" do
      temp = TemperatureConverter.new(input_scale: 'kelvin', output_scale: 'fahrenheit')
      expect(temp.convert(0)).to eql(-459.67)
    end
  end
end
