require 'active_support/core_ext/string'
require 'json'

#-------------------------------------------------------------------------------

class Hash  
  def flattenize!
    self.each_pair do |key, value|
      if flatable?(value)
         data_key =  String(key).singularize
         self[key] = value.map{|data_hash| (data_hash[data_key.to_sym] || data_hash[data_key])}.compact
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


	@hash_1 = { 
					  attribute_one: "foo",
					  posts: [
							    { post: { name: "p1", content: "post one" } },
							    { post: { name: "p2", content: "post two" } },
							    { 'post' =>  { name: "p3", content: "post three" } }
					  ]
			}
			
p 	@hash_1.flattenize!		
