source_string = "hello"
target_string = "llohe"


# To test whether a string is substring of other. Logic

def substring?(str1, str2)
  for i in 0..(str1.length-1) 
    #p str1[i..(i+(str2.length-1))]    
    if(str1[i..(i+ (str2.length-1))] == str2)
      return true
    end
  end
  if(i == str1.length-1)
    return false
  end
end

str1 = 'I am Indian. I live in Agra'
str2 = 've i'

#p substring?(str1, str2)

joined_string = source_string+source_string
p joined_string
if substring?(joined_string, target_string)
  puts "Target string is cyclic shift"
else
  puts "Target string is not cyclic shift"
end

#http://www.geeksforgeeks.org/a-program-to-check-if-strings-are-rotations-of-each-other-or-not/
