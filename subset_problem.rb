def subsets_with_sum_less_than_or_equal(reference_value, array)
 # array = array.sort {|a,b| a <=> b}
  previous_sums = []
  array.each do |element|
    #p element
    new_sums = []
    new_sums << [element] if element <= reference_value
    previous_sums.each do |previous_sum|
      current_sum = previous_sum + [ element ]
     if current_sum.inject(0){|accumulator,value|accumulator+value} == reference_value
      #p 'inserted'
      p current_sum
      exit
      #new_sums << current_sum 
     end
    end
    previous_sums = previous_sums + new_sums
    #p previous_sums
  end
  previous_sums
end

def subsets_with_sums_equal(reference_value, array)
  subsets_with_sums_less_than_or_equal = subsets_with_sum_less_than_or_equal(reference_value, array)
  subsets_adding_up_to_reference_value = subsets_with_sums_less_than_or_equal.inject([]) do |accumulator, subset|
    accumulator << subset if subset.inject(0){|sum, value| sum+value} == reference_value
    accumulator
    #subset if subset.inject(0){|sum, value| sum+value} == reference_value
  end
  subsets_adding_up_to_reference_value
end


array = [10, 6, 10, 2, 4, 5, 2, 2, 2]
subsets_with_sums_equal(14, array)
