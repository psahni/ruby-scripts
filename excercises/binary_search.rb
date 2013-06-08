def binary_search(arr, low, high, target)
 while( low <=high) do
   mid = low + (high - low)/2
   if(target < arr[mid])
    high = mid - 1
   elsif target > arr[mid]
     low = mid + 1
   else
     return mid
   end   
 end
  return -1; 
end

#arr = [32, 42, 23, 21, 29, 60]
arr = [ 2, 4, 1, 3, 5 ]
sorted = arr.sort
#puts "Sorted Array = #{ sorted.inspect }" 
n = 32
low = 0
high = arr.length
#ans = binary_search(sorted, low, high-1, n)

while(arr.length!=0) do
 first_element = arr[0]
 puts "Finding inversion for #{ first_element }"
 puts "Array = #{ arr.inspect }" 
 puts "Sorted Array = #{ sorted.inspect }" 
 pos = binary_search(sorted, low, high, first_element)
 p pos
 puts "************************************************"
 arr.shift
 sorted.delete(first_element)
 low = 0
 high = sorted.length
end

#~ int binary_search(int a[], int low, int high, int target) {
    #~ while (low <= high) {
        #~ int middle = low + (high - low)/2;
        #~ if (target < a[middle])
            #~ high = middle - 1;
        #~ else if (target > a[middle])
            #~ low = middle + 1;
        #~ else
            #~ return middle;
    #~ }
    #~ return -1;
#~ }

