require 'rubygems'
require 'active_record'
require 'mysql2' 
require 'logger'

# Estabalish Connection
ActiveRecord::Base.establish_connection(
  adapter:    'mysql2', 
  host:       'localhost',
  database:   'casserver',
  username:   'root',
  password:   'root'
)

ActiveRecord::Base.logger = Logger.new(STDOUT)

class User < ActiveRecord::Base
    
  attr_accessor :password_confirmation, :password
  
  # Validations
  
  validates :email, :username, :presence => true
  validates :email, :uniqueness => true
  
  validates :password, :presence => true,              :if => :password_required?
  validates :password_confirmation, :presence => true, :if => :password_required?
  validates_confirmation_of :password,                  :if => :password_required?
  
  

	def self.create_user
		user = User.new(:email => 'prashantsahni5@gmail.com', :username => 'psahni', :password => 'pass123', :password_confirmation => 'pass123')		
  	if user.valid?
	  	 user.save
	  else
		 puts "user is not valid"
		 p user.errors.full_messages
	  end

	end
	
  

  private
  
  def password_required?
    encrypted_password.blank?  || !password.blank?
  end
  
  
end


#User.create_user
p User.all


https://github.com/gunark/rubycas-client/blob/master/examples/rails/app/controllers/simple_example_controller.rb
https://github.com/rubycas/rubycas-client
https://github.com/rubycas/rubycas-client-rails
https://github.com/rubycas/rubycas-server/wiki/Installation
https://github.com/rubycas/rubycas-server/wiki/Usage-Scenarios
https://github.com/rubycas/rubycas-client-rails/blob/master/lib/rubycas-client-rails.rb
http://rubyglasses.blogspot.in/2009/12/login-to-rubycas-from-form.html


#logger = Logger.new(STDOUT)
#logger.warn('This message goes to stdout')

