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
  
  
  
  
  private
  
  def password_required?
    encrypted_password.blank?  || !password.blank?
  end
  
  
end

user = User.new(:email => 'prashantsahni5@gmail.com', :username => 'psahni', :password => 'pass123', :password_confirmation => 'pass123')

#logger = Logger.new(STDOUT)
#logger.warn('This message goes to stdout')

if user.valid?
	 user.save
else
	puts "user is not valid"
	p user.errors.full_messages
end

