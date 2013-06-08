#------------------------------------------------------------------------------------------------------------------
#  Use a one-liner to find the longest word in the array: arr = %w{what is the longest word in this arrrrrray}
#------------------------------------------------------------------------------------------------------------------

array = %w{what is the longest word in this arrrrrray}
array.inject{|longest_word, word| word.length > longest_word.length ? word : longest_word }

#---------------------------------------------------------------------------------------------------------------------------------------
# Convert [[0, 1, 2], [3, 4, 5], [6, 7, 8]] to [[0, 3, 6], [1, 4, 7], [2, 5, 8]]  Notice the pattern - we are looking for the columns.
#---------------------------------------------------------------------------------------------------------------------------------------

a1 = [ [0, 1, 2], [3, 4, 5], [6, 7, 8] ] 
a2 = [[], [], []]


for i in 0..a1.length-1 do

j=0
 while(j< a1.length) do
   a2[j][i] = a1[i][j]
   j = j+1
 end
 
end

str="ErDN"	
str.delete!('E')


# How do you find second highest number in an integer array?
#------------------------------------------------------------------------------------------------
arr = [23,42,-1,22,34] 

max     = arr[0]
sec_max = arr[0]

for i in 0..arr.length-1 do
  
  
  if arr[i] > max
    max = arr[i]
  elsif arr[i] > sec_max
   sec_max = arr[i]
  end
  
  
  
end
p max
p sec_max



