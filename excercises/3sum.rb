# Given a number and an array, find 3 numbers that sum up to that number
#http://stackoverflow.com/questions/4720271/find-a-pair-of-elements-from-an-array-whose-sum-equals-a-given-number
# Method1 - Not working       
def sum(array, solution)
  array.sort!

  i, j = 0, array.size - 1

  counter = 0

  while j > i
    k = array[counter] + array[i] + array[j]
    if k > solution
      j -= 1  
    elsif k < solution
      i += 1  
    else
      return [array[i], array[j], array[counter]]
    end
    counter += 1
  end
end

# Method2 - Working

def find_match(arr)
 
 for i in 0..arr.length-2 do
   j = i
   k = arr.length-1  
   while( k >= j ) do
     if (arr[i] + arr[j] + arr[k]) == 6
      p "==> Found Matching"
      p [arr[i], arr[j], arr[k]] 
     end
    (arr[i] + arr[j] + arr[k]) > 6 ? (k=k-1) : (j=j+1)
   end
 end
 
end

arr = [4, 5, 0, 2, 3, -1]
p arr.sort
 find_match(arr.sort)
 
# Works for two also, just take sum of a[j] & a[k]
