
# Coding inversions in an array

# The sequence 2, 4, 1, 3, 5 has three inversions (2, 1), (4, 1), (4, 3).

# For each element, count number of elements which are on right side of it and are smaller than it.


# http://stackoverflow.com/questions/337664/counting-inversions-in-an-array/6424847#6424847
#http://www.geeksforgeeks.org/counting-inversions/
def get_inv_count(arr)
  length =  arr.length
  count = 0
  for i in 0..length-2 do
    for j in i+1..length-1 do
      if( arr[i] > arr[j] )
          print "(#{ arr[i]},"  "#{ arr[j]})\n"
          count=count+1
      end
    end
  end
  return count
end


arr = [ 2, 4, 1, 3, 5 ]

#get_inv_count(arr)



def sort_and_count(arr)
  return [0, arr] if arr.length <= 1

  mid       =  arr.length / 2  
  left_arr  =  arr[0..(mid - 1)] 
  right_arr =  arr[mid..(arr.length - 1)]

  left_result  = sort_and_count(left_arr)
  right_result = sort_and_count(right_arr)
  merge_result = merge_and_count(left_result[1], right_result[1])
  [left_result[0] + right_result[0] + merge_result[0], merge_result[1]]
end

def merge_and_count(left_arr, right_arr)
  inversions = 0
  output = []
  i,j = 0,0
  while i < left_arr.length and j < right_arr.length
    if left_arr[i] < right_arr[j]
      output << left_arr[i]
      i+=1
    else
      output << right_arr[j]
      j+=1
      inversions += left_arr.length - i
    end
  end

  if i < left_arr.length
    output += left_arr[i..(left_arr.length - 1)]
  else
    output += right_arr[j..(right_arr.length - 1)]
  end

  return [inversions, output]
end

p sort_and_count arr
