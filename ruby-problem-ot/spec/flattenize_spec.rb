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
	    @hash2_result = {
	    					:attribute_one => "foo", 
	    					:posts => [
	    					    	{:name=>"p1", :content=>"post one"}, 
	    						    {:name=>"p2", :content=>"post two"}, 
	    						    {:name=>"p3", :content=>"post three"}
	    						], 
	    					:users => [
		    						{:name=>"U1"}, 
		    						{:name=>"U2"}, 
		    						{:name=>"U3"}
	    						], 
	    					:meta => [{
	    								:attribute_one => "foo", 
	    								:countries => [
    										{:name =>"India", :capital => "New Delhi"}, 
	    									{:name =>"Australia", :capital => "sydney"}, 
	    									{:name =>"United States", :capital => "Washington"}]
	    							}]
	    			}

	    expect(@hash2.flattenize!).to eq(@hash2_result)
	end

	it "should flattenize an array containing hash" do
		@array = ['posts', [
					{users: [{user:{name: 'Prashant'}}, {user: {name: 'Shubhum'}}]}],
				     	{
				         attribute_one: 'foo',
				         posts: [{title: 'post1'}, {title: 'post2'}],
				         countries: [
				             {country: {name: 'India', content: 'car one'}},
				             {country: {name: 'Austrailia', content: 'car two'}},
				             {country: {name: 'New Zealand', content: 'car three'}},
				             {country: {name: 'Mauritious', content: 'car three'}},
				         ]
				     }
				 ]
		@array_result =  ["posts", 
							[
								{
									:users	=> [
											{:name=>"Prashant"}, 
											{:name=>"Shubhum"}
										]
								}], 
								{
									:attribute_one => "foo", 
									:posts => [
												{:title=>"post1"}, 
												{:title=>"post2"}
										], 
									:countries => [
												{:name=>"India", :content=>"car one"}, 
												{:name=>"Austrailia", :content=>"car two"}, 
												{:name=>"New Zealand", :content=>"car three"}, 
												{:name=>"Mauritious", :content=>"car three"}
											]
								}
					]

		expect(@array.flattenize!).to eq(@array_result)
	end



end
