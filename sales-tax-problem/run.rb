#
# { "book", 12.49f , ItemType.BOOK , 12.49f },
#			   { "Music CD", 14.99f , ItemType.OTHERS , 16.49f},
#			   { "chocolate bar" , 0.85f , ItemType.FOOD , 0.85f} ,
#			   { "imported box of chocolates", 10.00f, ItemType.IMPORTED_FOOD, 10.50f},
#			   { "imported bottle of perfume", 47.50f, ItemType.IMPORTED_OTHERS, 54.65f},
#			   { "imported bottle of perfume", 27.99f,ItemType.IMPORTED_OTHERS , 32.19f},
#			   { "bottle of perfume", 18.99f, ItemType.OTHERS , 20.89f},
#			   { "packet of headache pills", 9.75f , ItemType.MEDICAL, 9.75f},
#			   { "box of imported chocolates",11.25f,ItemType.IMPORTED_FOOD, 11.85f}
#};


require File.expand_path(File.join(__FILE__, '..', 'cart'))

item1 = Item.new(:name => "Music CD", :item_type => ItemType::OTHERS, :price => 14.99, :imported => false, :exempted => false)
item2 = Item.new(:name => "Book", :item_type => ItemType::BOOK, :price => 12.49, :imported => false, :exempted => true )

cart = Cart.new

cart.add_to_cart(item1)
cart.add_to_cart(item2)

#puts cart.to_s
puts cart.print_receipt


#classes
# ItemType, Item, Calculator, TaxType, Cart, TaxType
