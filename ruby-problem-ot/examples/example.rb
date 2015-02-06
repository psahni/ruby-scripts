require_relative '../lib/flattenize'
require 'json'
class Example

	class << self

		def example_1
			ex = { 
					  attribute_one: "foo",
					  posts: [
							    { post: { name: "p1", content: "post one" } },
							    { post: { name: "p2", content: "post two" } },
							    { post: { name: "p3", content: "post three" } }
					  ]
			}		
			pretty_print ex
		end

		def example_2
			ex = {
	        	attribute_one: 'foo',
		        posts: [
		            {post: {name: 'p1', content: 'post one'}},
		            {post: {name: 'p2', content: 'post two'}},
		            {post: {name: 'p3', content: 'post three'}}
		        ],
		        users: [
		            {user: {name: 'U1'}},
		            {user: {name: 'U2'}},
		            {user: {name: 'U3'}}
		        ],
	        	meta: [{
						  attribute_one: 'foo',
                    	  countries: [
                          {country: {name: 'India', 		capital: 'New Delhi'}},
                          {country: {name: 'Australia', 	capital: 'sydney'}},
                          {country: {name: 'United States', capital: 'Washington'}}
                      ]
                  }]
	   		}
	   		pretty_print ex
		end

		def example_3
			ex = ['posts',
			     	{
			         	attribute_one: 'foo',
			         	posts: [{title: 'post1'}, {title: 'post2'}],
			         	countries: [
			             {country: {name: 'India', content: 'car one'}},
			             {country: {name: 'Austrailia', content: 'car two'}},
			             {country: {name: 'New Zealand', content: 'car three'}},
			             {country: {name: 'Mauritious', content: 'car three'}},
			         ]
			     }]
		     pretty_print ex
		end

#---------------------------------------------------------------------------------

		private

		def pretty_print(input)
			puts "="*80
			puts "			Executing Input"
			puts "="*80
			puts JSON.pretty_generate(input)
			puts "="*80
			puts "			Got Output"
			puts "="*80
			puts JSON.pretty_generate(input.flattenize!)
		end
	end
end
