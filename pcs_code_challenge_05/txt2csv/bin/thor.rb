#!/usr/bin/env ruby
# this first line is how the operating system knows to use ruby to execute this file
# use chmod u+x thordemo to make sure the file is executable

require 'thor'
require_relative '../lib/commands.rb'

class ThorDemo < Thor

  # declare  options
  # class options apply to all commands

  class_option :s, aliases: ['--name_suffix'],
                desc: 'Global option that makes the app chatty'
  # method options only apply to a particular method
  # The priority option only applys to the list command

  class_option :p, aliases: ['--name_prefix'],
                desc: 'Set the priority of the list command'

  desc 'list', 'a command that claims to list all the things but does not'
  def list
    puts 'txt2csv analyze {--name_prefix | -p} -i textfile.txt -o prefix_histogram.txt
txt2csv analyze {--name_suffix | -s} -i textfile.txt -o suffix_histogram.txt'

    # Can you make this appear? Using -c should cause an error
    if options[:c]
      puts "the case option is set to #{options[:c]}"
    end
    puts "Happy to be of service!" if options[:v]
  end



  # method options only apply to a particular method
  # The case option only applys to the echo command

  option :c, aliases: ['--case'],
                desc: 'Set the case of the list command',
             default: 'Upper',
              banner: 'CASE'

  # commands can be in other classes, but the description must be here
  # note how the arguments are used by thor to determine the command line interface
  desc 'echo things...', 'command that prints one or more things'
  def caller(analyze, pre_suf, infile, outfile)

    case options

    when :p
      analyze.(options[:p], infile, outfile)

    when :s
      analyze.(options[:s], infile, outfile)
    end

  end

end # class ThorDemo

ThorDemo.start
