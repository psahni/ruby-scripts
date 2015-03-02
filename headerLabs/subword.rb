require './lib/subword'
require 'colorize'

def prompt(*args)
  print(*args)
  $stdin.readlines
end

lines = prompt "Input line, Press Enter and Ctrl-D to quit:\n"
WordReader.new(lines).print_subwords
puts "End of input encountered, #{lines.length} #{lines.length > 1 ? 'words': 'word'} processed."

