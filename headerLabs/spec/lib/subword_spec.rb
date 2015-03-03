require_relative '../spec_helper'

describe Subword do

  it "should split a word and number from line" do
    line = "cat 3"
    subword = Subword.new(line)  
    expect(subword.word).to eql('cat')
    expect(subword.no).to eql('3')
  end

  it "should get permutations for word as per value of no, when no is equal to length of word" do
    line = "cat 3"
    permutations = Subword.new(line).get_permutations
    expect(permutations.length).to eql(3*2*1)
    expect(permutations.first.join().length).to eql(3)
  end
  
  it "should get permutations for word as per value of no, when no is less than length of word" do
    line = "cat 2"
    permutations = Subword.new(line).get_permutations
    expect(permutations.length).to eql(3*2*1)
    expect(permutations.first.join().length).to eql(2)
  end
  
  it "should return with error if no is greater than the length of the word" do
    line = "cat 4"
    output = Subword.new(line).get_permutations
    expect(output.class).to eq(SubwordError)
    expect(output.message).to match(/Number greater than length of word/)
  end
  
  it "should return with error if word is longer than 20 characters" do
    line = "abcdefghijklmnopqrstu 10"
    output = Subword.new(line).get_permutations
    expect(output.class).to eq(SubwordError)
    expect(output.message).to match(/Word longer than 20 characters/)
  end
  
  it "should return error when word does not contain valid characters" do
    line = "123cat 3"
    output = Subword.new(line).get_permutations
    expect(output.class).to eq(SubwordError)
    expect(output.message).to match(/Illegal character in word/)
    line = "cat\#@ 3"
    output = Subword.new(line).get_permutations
    expect(output.class).to eq(SubwordError)
    expect(output.message).to match(/Illegal character in word/)    
  end
  
  it "should return error when no contain invalid characters" do
    line = "cat s2"
    output = Subword.new(line).get_permutations
    expect(output.class).to eq(SubwordError)
    expect(output.message).to match(/Illegal character in number/)
  end
  
    
end
