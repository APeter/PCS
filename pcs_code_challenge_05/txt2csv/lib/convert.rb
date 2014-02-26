require 'CSV'
require_relative 'analyze.rb'

class Convert
  def initialize
    @input = File.new(input_name, 'r')
    @prefix_file = File.new(prefix_name, 'r')
    @suffix_file = File.new(suffix_name, 'r')
    @output = File.new(output_name, 'w')
    @prefix = Array.new
    @suffix = Array.new
  end

  def convert_fix
    @prefix_file.each_line { |line| @prefix << line.split[0] }
    @suffix_file.each_line { |line| @suffix << line.split[0] }
end
