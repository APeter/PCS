  def initialize(input_file, output_file)
    @input = File.open(input_file, 'r')
    @output = File.new(output_file, 'w+')
    analyze

  def analyze(parsed_word)
    histogram = Hash.new(0)

    @input.each_line do |line|
      histogram = CSV.parse(line, col_sep: '\t')
      puts histogram[hash_data.to_sym] += 1
    end
  end

  def pattern_choice
    case

  end
end
