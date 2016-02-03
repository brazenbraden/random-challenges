#!/usr/bin/env ruby
require 'optparse'

class CaesarShift
  attr_accessor :rot

  def initialize rot = 6
    @rot = rot
  end

  def encrypt message
    perform message
  end

  def decrypt message
    @rot = -@rot
    perform message
  end

  private

  def perform message
    crypted = ""
    message.each_byte do |char_code|
        crypted << in_range(char_code)
    end
    crypted
  end

  def in_range(char_code)
    upper = Range.new(65,90) # 65 - 90 = A - Z
    lower = Range.new(97,122) # 97 - 122 = a - z
    return shift(char_code, upper) if upper.include? char_code
    return shift(char_code, lower) if lower.include? char_code
    return (char_code == 32) ? " " : char_code.chr
  end

  def shift(char_code, range)
    new_char = char_code + @rot
    @rot > 0 ? positive(new_char, range) : negative(new_char, range)
  end

  def positive(new_char, range)
    (new_char > range.last) ? (range.first + (new_char - (range.last + 1))).chr : new_char.chr
  end

  def negative(new_char, range)
    (new_char < range.first) ? (range.last - (range.first - (new_char + 1))).chr : new_char.chr
  end
end
