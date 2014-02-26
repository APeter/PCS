require 'CSV'
require 'spec_helper'

class Analyze
  def initialize(input_file, output_file)
    @input = File.new(input_file, 'r')
    @output = File.new(output_file, 'w')
    @fix = fix
    Analyze
  end

  def analyze
    histogram = Hash.new(0)
    @input.each_line do |line|
    input_hist = CSV.parse_line(line, col_sep: '\t')
  end

  def prefixes
    pref = /^\w+\.?/.match(input_hist[0])
      histogram[pref.to_sym] += 1
      histogram[|key, value| value).reverse!
    end
  end

  def suffixes
    suff = /\w+\.?$/.match(input_hist[0])
      histogram[suff.to_sym] += 1
  end

  histogram = Hash[ histogram.sort_by { |word, count| count }.reverse]
  histogram.each { |word, count| @output puts '#{word}  #{count}' }

  def pattern_choice
    case @fix
    when '-p'
      parsed_word = histogram
    when '-s'
      parsed_word = histogram
    end
    parsed_word
  end
end
