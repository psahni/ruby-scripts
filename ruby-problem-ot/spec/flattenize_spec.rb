require 'spec_helper'


describe 'Flattenize' do

	 
	it "should flatttenize hash containing array of hash objects" do		
		@hash_1 = { 
					  attribute_one: "foo",
					  posts: [
							    { post: { name: "p1", content: "post one" } },
							    { post: { name: "p2", content: "post two" } },
							    { post: { name: "p3", content: "post three" } }
					  ]
			}	
		@hash_1_result = {
				:attribute_one	=>	"foo", 
				:posts	=>	[
								{:name=>"p1", :content=>"post one"}, 
								{:name=>"p2", :content=>"post two"}, 
								{:name=>"p3", :content=>"post three"}
							]
				}	
		expect(@hash_1.flattenize!).to eq(@hash_1_result)
	end

	it "should flattenize hash containing multiple array of hash objects" do
			@hash2 =   {
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

	    puts JSON.pretty_generate(@hash2.flattenize!)
	end


end
