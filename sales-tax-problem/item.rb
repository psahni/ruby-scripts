require File.expand_path(File.join(__FILE__, '..', 'calculator'))
require File.expand_path(File.join(__FILE__, '..', 'item_type'))

class Item

  include Calculator
  
	attr_accessor :name,
	              :price,
	              :item_type,
	              :imported,
	              :exempted
	
	
	def initialize(attrs)
		@name  = attrs[:name]
		@price = attrs[:price]
		@item_type = attrs[:item_type]	
		@imported  = attrs[:imported]
		@exempted  = attrs[:exempted]
	end
		
	def to_s 
		"1" + " " + self.name +  ": " + price_with_tax().to_s 
	end
	
	def imported?
	 !!imported
	end

	def exempted?
	 [ItemType::BOOK,  ItemType::MEDICAL, ItemType::FOOD].include?(item_type)
	end
		
	def price_with_tax()
   round_of_tax(calculate_sales_tax() + self.price)
	end
	
  def calculate_sales_tax()
	 @sales_tax||=Calculator.calculate_tax(self)
	end
	
	def sales_tax
		@sales_tax
	end
	
	def tax_type
		if imported? && !exempted?
 	  	 TaxType::BOTH
 	  elsif imported? && exempted?
 	     TaxType::IMPORTED
 	  elsif imported? && exempted?
 	  	TaxType::BASIC
 	  else
 	  	TaxType::NA
 	  end
	end

 
 	private
 	
 	def round_of_tax(tax) # Round upto 2 decimal places
 		((tax*100).round/100.0)
 	end
 	
end

