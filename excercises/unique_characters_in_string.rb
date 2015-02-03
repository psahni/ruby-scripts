#~ def is_unique_chars(str)
  
  #~ if(str.length) > 256 	
   #~ return false 
  #~ end
  
  #~ checker = 0
  
  #~ for i in 0...str.length-1 do
    #~ val = str[i] - 97
    
    #~ if( (checker & (1 << val)) > 0 )
      #~ return false    
    #~ end
    #~ checker |=(1<<val)    
  #~ end
  
  #~ return true	  

#~ end





def is_unique_chars(str)

  hash = Hash.new
  
  for i in 0..str.length-1 do
    if hash[str[i].chr]
	return false
    else
      hash[str[i].chr] = true 
    end	
  end
  return true
end

str = "abcd"

p is_unique_chars(str)

# Time Complexity  O(n)
# Space Complexity O(1)