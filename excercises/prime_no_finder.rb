

#~ def generate_prime_nos(upto)
  
  #~ if upto < 2
   #~ return 1
  #~ end
  
  #~ prime_numbers = [2]
  
  #~ for i in 3..upto	  
    #~ for j in 2..i-1
       #~ if(i%j == 0)
	#~ print "#{ i } is not a prime number\n"
	#~ break
       #~ else
	#~ next
       #~ end       
    #~ end
    
    #~ if( j == i-1 )
      #~ print "#{ i } is a prime number\n"
    #~ end
  #~ end
  
#~ end



#~ generate_prime_nos(10)