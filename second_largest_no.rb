
array = [32, 54, 55, 12, 43, 76]


def second_largest(array)
  max = array[0]
  second_max = max
  array.each do |element|
    if element > max
       second_max = max
       max = element 
    end
  end
  p "SMax = #{ second_max }"
end

second_largest(array)

