  def initialize(input_file, output_file)
    @input = File.new(input_file, 'r')
    @output = File.new(output_file, 'w')
    @fix = fix
    analyze

  def analyze
    histogram = Hash.new(0)
    @input.each_line do |line|
      input_hist = CSV.parse_line(line, col_sep: '\t')
    end
  end

  def prefixes
    pref = /^\w+\.?/.match(input_hist[0])
      histogram[pref.to_sym] += 1
      histogram.reverse!
    end
  end

  def suffixes
    suff = /\w+\.?$/.match(input_hist[0])
      histogram[suff.to_sym] += 1
      histogram.reverse!
    end
  end

  def pattern_choice
    case @fix
    when '-p'
      parsed_word = prefixes
    when '-s'
      parsed_word = suffixes
    end
    parsed_word
  end
end
