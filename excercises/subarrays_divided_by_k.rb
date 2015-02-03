# http://stackoverflow.com/questions/16605991/number-of-subarrays-divisible-by-k/16606634#16606634
#https://github.com/eLobato/ruby-algorithm-problems
# Method 1

#def get_sub_arrays(arr)
#  count, s = 0, 0
#  for i in 0..arr.length-1 do
#    s = 0
#    for j in i..arr.length-1 do
#      s = s + arr[j]
#      if(s%5 == 0)
#        p "S = #{s}"
#        count = count+1
#      end
#    end
#  end
#  p "No of sub arrays  - #{ count }"
#end

#http://www.geeksforgeeks.org/find-subarray-with-given-sum/

# Method 2

def get_sub_arrays2(arr)
  hash = Hash.new(0)
  hash[0] = hash[0]+1
  s = 0
  for i in 0..arr.length-1 do
   #p "Value = #{ arr[i] } "  
   #p s
   s=(s+arr[i])%26
   p
   hash[s] = hash[s] + 1
  end
  # p hash
  ans = 0
  for i in 0..(arr.length-1)  do
   ans+=(hash[i]*(hash[i]-1)/2)
  end
  p hash
  return ans
end

#arr = [4, 5, 0, -2, -3, 1]
arr = [10, 12,13, 9, 4, 14, 5]

p get_sub_arrays2(arr.sort)

