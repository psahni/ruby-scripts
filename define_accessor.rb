def define_accessor(name, &block)
  self.class.class_eval{
    define_method(name, &block)
  } if not respond_to?(name)
  
end

define_accessor('username') { "prashant.sahni5"}
p username
