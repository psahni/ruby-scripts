class SubwordError < Exception
  
  attr_reader :message
  
  def initialize(message)
    @message = message
  end
  
end

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

  attr_reader :word, :no
  
  def initialize(line)
    @word, @no = line.strip.split(/\s+/)
  end

  def get_permutations   
    return SubwordError.new(error_prefix + "Word longer than 20 characters") if @word.length > 20
    return SubwordError.new(error_prefix + "Number greater than length of word")  if @word.length < @no.to_i
    return SubwordError.new(error_prefix + "Illegal character in number")    if @no.to_i == 0 || @no.match(/[a-zA-Z]/)
    return SubwordError.new(error_prefix + "Illegal character in word")      unless @word.match(/^[a-zA-Z]+$/)
    @word.chars.permutation(@no.to_i).to_a
  end
  
  def print_subwords 
    output = get_permutations   
    if SubwordError === output
       puts output.message
    else
      output.each do |sword|     
        puts(Array === sword ? sword.join() : sword)
      end 
    end   
  end  
  
##--- Private ---
  
  private
  
  def error_prefix
    "[Input Error]: ".red
  end
  
end

