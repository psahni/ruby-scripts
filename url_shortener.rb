#http://www.vikasing.com/2010/11/simple-url-shortening-algorithm-in-java.html
#http://stackoverflow.com/questions/742013/how-to-code-a-url-shortener#

# Ruby Solution
#https://gist.github.com/zumbojo/1073996


class Base62Converter
	ALL_ELEMENTS  = (('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a).join

	def convert_to_string(long_no)
		base = ALL_ELEMENTS.length
		temp_val = long_no  == 0 ? '0' : ''
		return ALL_ELEMENTS[0] if temp_val == 0
		while(long_no > 0) do
			#p long_no
			mod = long_no%base
			#p mod
			temp_val << ALL_ELEMENTS[mod]
			#p temp_val
			long_no = long_no/base
		end
		temp_val.reverse
	end
	
	def decode_string(string)
	 value = 0
   base = ALL_ELEMENTS.length
   string.each_char { |c| value = value * base + ALL_ELEMENTS.index(c) }
   value
	end
	
end


convertor =  Base62Converter.new()
code = convertor.convert_to_string(364)
p convertor.decode_string(code)

