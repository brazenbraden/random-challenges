class CaesarShift
  ALPHABET_SIZE = 26
  FIRST_UPPER = 65 # A
  FIRST_LOWER = 97 # a
  attr_accessor :rot

  def initialize rot = 6
    @rot = rot
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
      if char_code.between?(FIRST_UPPER, FIRST_UPPER + ALPHABET_SIZE)
        char_code = (char_code - FIRST_UPPER + offset) % ALPHABET_SIZE + FIRST_UPPER
      elsif char_code.between?(FIRST_LOWER, FIRST_LOWER + ALPHABET_SIZE)
        char_code = (char_code - FIRST_LOWER + offset) % ALPHABET_SIZE + FIRST_LOWER
      end
      char_code.chr
    }.join
  end

end
