require 'colorize'

class WordInputReader

  def initialize(lines)
    puts "Invalid Input" unless Array === lines
    @lines = lines
  end
  
  def print_subwords
    @lines.each do |line|
      puts "*".yellow*80
      puts "Input:".green + "\n#{ line }"
      puts "Output:".green
      Subword.new(line.chomp).print_subwords
    end
    puts "*".yellow*80
  end
  
end

class Subword

  def initialize(line)
    @word, @no = line.strip.split(/\s+/)
  end

  def get_permutations
    puts error_prefix + "Number greater than length of word" if @word.length < @no.to_i
    puts error_prefix + "Illegal character in number" if @no.to_i == 0
    @word.chars.permutation(@no.to_i).to_a
  end
  
  def print_subwords    
    get_permutations.each do |sword|
      puts sword.join()
    end    
  end  
  
  private
  
  def error_prefix
    "[Input Error]: ".red
  end
  
end



def prompt(*args)
  print(*args)
  $stdin.readlines
end

lines = prompt "Input line Press Enter and then Ctrl-D to quit:\n"
WordInputReader.new(lines).print_subwords

