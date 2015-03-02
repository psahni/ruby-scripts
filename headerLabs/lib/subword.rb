require 'colorize'

class WordReader

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
    return [error_prefix + "Word longer than 20 characters"] if @word.length > 20
    return [error_prefix + "Number greater than length of word"]  if @word.length < @no.to_i
    return [error_prefix + "Illegal character in number"]    if @no.to_i == 0 || @no.match(/[a-zA-Z]/)
    return [error_prefix + "Illegal character in word"]      if @word.match(/\d+/)
    @word.chars.permutation(@no.to_i).to_a
  end
  
  def print_subwords    
    get_permutations.each do |sword|     
      puts(Array === sword ? sword.join() : sword)
    end    
  end  
  
##--- Private ---
  
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
WordReader.new(lines).print_subwords

