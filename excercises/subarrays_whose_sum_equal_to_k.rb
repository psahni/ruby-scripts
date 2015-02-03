
#def get_sub_arrays(arr)
#  sum = 0
#  temp = []
#  for i in 0..(arr.length-1)
#    sum+=arr[i]
#    temp << arr[i]
#    if(sum==10)
#      p temp 
#      temp = []
#      sum = 0
#    end
#  end
#end

#arr = [3, 2, 4, 0, 1, 6, 3]

#subarrays whose sum is 10 are
#[3,2,4,1]
#[6,4]
#[6,3,1]
#[2,4,1,3]

#get_sub_arrays(arr)

def subarray(arr, sum)
  curr_sum = arr[0]
  start = 0
  for i in 1..(arr.length-1) do
    #p curr_sum
    while( (curr_sum > sum)) do
       curr_sum = curr_sum - arr[start]
       #p start
       start =  start+1
    end
   
    if( curr_sum == sum )
      #p start
      #p curr_sum
      puts "Sub Array = #{ arr[start..i-1]}"
      return
    end
   
    if(i < arr.length)
      curr_sum = curr_sum + arr[i]
    end   
  end
  puts "No Sub Array has been found"
end

arr = [5, 60, 45, 30, 30, 45, 60, 60, 45, 30, 30, 60, 30, 30]

subarray(arr, 180)
