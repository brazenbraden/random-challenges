#!/usr/bin/env ruby
require 'optparse'

class CaesarShift

  # def initialize options, message = nil
  #   @message = options[:encrypt] || options[:decrypt] || message
  #   rot = (options[:rotation].to_i == 0 ) ? 13 : options[:rotation].to_i
  #   abort("Please provide a message to encrypt or decrypt.") if @message.nil?
  #   abort("Invalid rotation amount. Valid numbers are in the range 1 -> 25.") unless (1..25).cover?(rot)
  #   @rot = options[:decrypt] ? -rot : rot
  #   puts "#{@message} (rot: #{@rot}) => #{rot13}" if @message
  # end
  #
  # private
  #
  # def rot13
  #   crypted = ""
  #   @message.each_byte do |char_code|
  #       crypted << in_range(char_code)
  #   end
  #   crypted
  # end
  #
  # def in_range(char_code)
  #   upper = Range.new(65,90) # 65 - 90 = A - Z
  #   lower = Range.new(97,122) # 97 - 122 = a - z
  #   return shift(char_code, upper) if upper.include? char_code
  #   return shift(char_code, lower) if lower.include? char_code
  #   return (char_code == 32) ? " " : char_code.chr
  # end
  #
  # def shift(char_code, range)
  #   new_char = char_code + @rot
  #   @rot > 0 ? positive(new_char, range) : negative(new_char, range)
  # end
  #
  # def positive(new_char, range)
  #   (new_char > range.last) ? (range.first + (new_char - range.last)).chr : new_char.chr
  # end
  #
  # def negative(new_char, range)
  #   (new_char < range.first) ? (range.last - (range.first - new_char)).chr : new_char.chr
  # end
end

# options = {}
# OptionParser.new do |opts|
#   opts.banner = "Usage: example.rb [options]"
#
#   opts.on("-e", "--encrypt STRING", "Encrypt a string") {|o| options[:encrypt] = o}
#   opts.on("-d", "--decrypt STRING", "Decrypt a string") {|o| options[:decrypt] = o}
#   opts.on("-r", "--rotation COUNT", "Value to rotate by (1 - 25)") {|o| options[:rotation] = o }
#   opts.on("-h", "--help", "Prints this help") {|o| puts opts}
# end.parse!
#
# begin
#   @result = Rot13.new options, ARGV.first
# end
