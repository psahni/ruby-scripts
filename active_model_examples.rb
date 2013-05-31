require 'active_model'
class Person
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  
  attr_accessor :name, :email, :content
  
  validates_presence_of :name
  validates_format_of :email, :with => /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\Z/i
  validates_length_of :content, :maximum => 500
  
  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
  
  def persisted?
    false
  end
  
end

message = Person.new(:name => "Prashant Sahni", :email => "prashantsahni5@gmail.com", :content => "Universe is so big")

p message.valid?



# References
#http://yehudakatz.com/2010/01/10/activemodel-make-any-ruby-object-feel-like-activerecord/
#http://www.rubyinside.com/rails-3-0s-activemodel-how-to-give-ruby-classes-some-activerecord-magic-2937.html