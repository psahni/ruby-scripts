# Calculate the sum of digits 2.pow(1000)

#~ def factorial(n)
 #~ if( n == 0 )
  #~ return 1
 #~ else
  #~ return n * factorial(n-1)
 #~ end
#~ end

# 2**n = 2**(n-1) + 2**(n-1) = [2**(n-2) + 2**(n-2)] + [2**(n-2) + 2**(n-2)]
power = 5

def sum(power)
   if power == 1
    return 2
   else
     p power
     sum(power-1) + sum(power-1)
   end
end

 p sum(1000)
