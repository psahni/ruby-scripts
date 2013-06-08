## Even Sum Pairs From Array


arr = [4,9,2,7,5]

# Method 1
def find_even_sum_pairs(arr)

 sum, even, odd = 0,0,0
 
 for i in 0..arr.length-1 do

  if(arr[i]%2 == 0)
   sum = sum + even
   even = even + 1
  else
    sum = sum + odd
    odd = odd + 1
  end
  
 end

 return sum
end



# Method 2

def factorial(n)
 return 1 if n==0 || n == 1
 n.downto(1).inject(:*) #(1..5).inject(:*)
end

def find_even_sum_pairs2(arr)
  
  sumo, sume = 0, 0
  for i in 0..arr.length-1 do
    if(arr[i]%2 == 0)
      sume = sume+1
    else
      sumo = sumo+1 
    end
  end
  sum = (factorial(sume)/(factorial(sume-2)*2))
  sum = (sum + (factorial(sumo)/(factorial(sumo-2)*2)))
  return sum
end

print "Executing Method 1 - "
p find_even_sum_pairs(arr)
print "Executing Method 2 - "
p find_even_sum_pairs2(arr)
