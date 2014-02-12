#----------------------------------------------------------------------------
#	Cart module has implementation of cart where user 
# buy product and help in calculating and printing tax.
#----------------------------------------------------------------------------
require File.expand_path(File.join(__FILE__, '..', 'item'))
require File.expand_path(File.join(__FILE__, '..', 'item_type'))

class Cart
	
		attr_accessor :item_list,
									:total_cost,
									:sales_tax
			
  	def initialize
			@item_list = Array.new  	
			@total_cost = 0.0
			@sales_tax = 0.0
  	end

		def add_to_cart(item)
			item_list << item	
		end
	
		def reset_cart
			@total_cost = 0.0
			@sales_tax = 0.0
		end
		
		def total_cost
			'%.2f' % @total_cost
		end
		
		def sales_tax                 # Example: '%.2f' % 89898 =  "89898.00"
		 '%.2f' % @sales_tax
		end
		
		def print_receipt
		 reset_cart()
		 buffer = ''
		 buffer.concat(self.to_s)
		 item_list.each do |item|
			 @total_cost+=item.price_with_tax()
			 @sales_tax+=item.sales_tax
		 end
		 
			buffer.concat("\nSales Tax: " + sales_tax)
			buffer.concat("\nTotal: " + total_cost)
			buffer
		end	
			
		def to_s
			buffer = ''
			item_list.each do |item|
				buffer.concat(item.to_s)	
				buffer.concat("\n")
			end	
			buffer
		end
			
		
end #Cart

