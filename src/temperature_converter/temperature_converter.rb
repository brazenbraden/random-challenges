class TemperatureConverter
  attr_accessor :in, :out

  def initialize input_scale: 'celsius', output_scale: 'fahrenheit'
    @in = input_scale
    @out = output_scale
  end

  def convert temp
    case @in
    when 'celsius'
      result = {
        celsius: temp,
        fahrenheit: (temp * 1.8) + 32,
        kelvin: temp + 273.15
      }
    when 'fahrenheit'
      result = {
        fahrenheit: temp,
        celsius: (temp - 32) / 1.8,
        kelvin: (temp + 459.67) * 5/9
      }
    when 'kelvin'
      result = {
        kelvin: temp,
        celsius: temp - 273.15,
        fahrenheit: (temp*(9/5)) - 459.67
      }
    end
    return ('%.2f' % result[@out.to_sym]).to_f
  end

end
