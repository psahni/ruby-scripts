require 'active_support/core_ext/string'

class Hash

  def flattenize!
    self.each_pair do |key, value|
      p value
      if flatable?(value)
        self[key] = value.map(&:values).flatten
      elsif Array === value
        value.flattenize!
      end
    end
  end
  
  def flatable?(array_hash)
    Array === array_hash && array_hash.map(&:values).flatten.all?{|v| Hash === v}
  end
  
end

class Array
  def flattenize!
    self.each do |element|
      if Hash === element
        element.flattenize!
      else
        
      end
    end
  end
end


