class Temperature
  UNITS = [:c, :f, :k].freeze

  def initialize value, unit
    validate unit
    @value = value
    @unit_from = unit
  end

  def value
    @value
  end

  def unit
    @unit_from
  end

  def to unit_to
    validate unit_to
    return value if unit_to == @unit_from

    k = to_k

    case unit_to
    when :k
      value = k
    when :c
      value = k - 273.15
    when :f
      value = k * 9/5 - 459.67
    end

    value.round(2)
  end

  private

  def validate unit
    raise ArgumentError unless Temperature::UNITS.include? unit
  end

  def to_k
    case @unit_from
    when :k
      @value
    when :c
      @value + 273.15
    when :f
      (@value + 459.67) * 5/9
    end
  end
end
