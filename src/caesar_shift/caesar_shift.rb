class CaesarShift
  attr_accessor :rot

  def initialize rot = 6
    @rot = rot
    @upper = Range.new(65, 90) # 65 - 90 = A - Z
    @lower = Range.new(97, 122) # 97 - 122 = a - z
  end

  def encrypt str
    rotate_str(str, @rot)
  end

  def decrypt str
    rotate_str(str, -@rot)
  end

  private

  def rotate_str(str, offset)
    str.bytes.map {|char_code|
      if @upper.include? char_code
        char_code = (char_code - @upper.first + offset) % @upper.count + @upper.first
      elsif @lower.include? char_code
        char_code = (char_code - @lower.first + offset) % @lower.count + @lower.first
      end
      char_code.chr
    }.join
  end

end
