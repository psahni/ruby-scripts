#~ class Solution

  #~ def initialize(array)
    #~ raise "Invalid Array" if !array.is_a?(Array) || array.empty?
    #~ @sol_array = array
    #~ @right_sum = 0
    #~ @left_sum = 0
    #~ @total_sum = 0    
  #~ end
  
  #~ def find_equilibirium_index
    
    #~ for i in 0..@sol_array.length-1 do
      #~ @total_sum+= @sol_array[i]
    #~ end    
	
    #~ @right_sum = @total_sum
    #~ for i in 0..@sol_array.length-1 do
     #~ @right_sum = @right_sum - @sol_array[i]     
     #~ return i if( @right_sum == @left_sum ) 
     #~ @left_sum = @left_sum + @sol_array[i]
    #~ end
    
   #~ return -1;
  #~ end
  
  
#~ end

#~ array = [-7,1,5, 2, -4, 3, 0]
#~ sol=Solution.new(array)
#~ p sol.find_equilibirium_index

def solution(array)
  raise "Invalid Array" if !array.is_a?(Array) || array.empty?
  @sol_array = array
  @right_sum = 0
  @left_sum = 0
  @total_sum = 0   
  
    
    for i in 0..@sol_array.length-1 do
      @total_sum+= @sol_array[i]
    end    
	
    @right_sum = @total_sum
    for i in 0..@sol_array.length-1 do
     @right_sum = @right_sum - @sol_array[i]     
     return i if( @right_sum == @left_sum ) 
     @left_sum = @left_sum + @sol_array[i]
    end
    
   return -1;
  
  rescue
   return -1
end
  
array = [-7,1,5, 2, -4, 3, 0]
p solution(array)