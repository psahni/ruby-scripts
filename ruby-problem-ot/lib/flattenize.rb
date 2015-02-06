require 'active_support/core_ext/string'
require 'json'

#-------------------------------------------------------------------------------

class Hash  
  def flattenize!
    self.each_pair do |key, value|
      if flatable?(value)
        self[key] = value.map(&:values).flatten      
      else
        if (Array === value)
         value.each do |element|
           element.flattenize! if Hash === element
          end
        end
      end
    end
    self
  end

  protected
  
  def flatable?(array_hash)
    if (Array === array_hash && array_hash.all?{|a| a.is_a?(Hash)}) 
     return array_hash.map(&:values).flatten.all?{|v| Hash === v}
    else
      return false
    end
  end
  
end


#-------------------------------------------------------------------------------

class Array
  def flattenize!
    self.each do |element|
      case element
        when Hash, Array
          element.flattenize!            
        end          
    end
    self
  end
end



#hash.flattenize!

#array1 = ['posts', [{users: [{user:{name: 'Prashant'}}, {user: {name: 'Shubhum'}}]}],
#     {
#         attribute_one: 'foo',
#         posts: [{title: 'post1'}, {title: 'post2'}],
#         countries: [
#             {country: {name: 'India', content: 'car one'}},
#             {country: {name: 'Austrailia', content: 'car two'}},
#             {country: {name: 'New Zealand', content: 'car three'}},
#             {country: {name: 'Mauritious', content: 'car three'}},
#         ]
#     }]

#p (array1.flattenize!)

#hash2 =   {
#        attribute_one: 'foo',
#        posts: [
#            {post: {name: 'p1', content: 'post one'}},
#            {post: {name: 'p2', content: 'post two'}},
#            {post: {name: 'p3', content: 'post three'}}
#        ],
#        cars: [
#            {car: {name: 'p1', content: 'car one'}},
#            {car: {name: 'p2', content: 'car two'}},
#            {car: {name: 'p3', content: 'car three'}}
#        ],
#        attribute_three: [1, 2,
#                          {
#                              attribute_one: 'foo',
#                              cars: [
#                                  {car: {name: 'p1', content: 'car one'}},
#                                  {car: {name: 'p2', content: 'car two'}},
#                                  {car: {name: 'p3', content: 'car three'}}
#                              ]
#                          }]
#    }
     
#puts JSON.pretty_generate(hash2.flattenize!)
