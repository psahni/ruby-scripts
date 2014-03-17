def search(element)
  
  array_2d = [[5, 16, 27], [10, 20, 29], [15, 25, 31]]
  i = 0 
  j = 2

  while(i <=2 && j >=0 ) do
  #puts  array_2d[i][j];
  if  element < array_2d[i][j]
     j = j - 1 #; puts  array_2d[i][j];puts "#{i} #{j}"     
   elsif element > array_2d[i][j] 
     i = i + 1 #;puts "#{i} #{j}"     
   else
      puts "Element #{ element } found at #{ i } #{ j }"
      break;
   end
  end


end


element = 31
search(element)
