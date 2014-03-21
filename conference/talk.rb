# Proposal:
# This is a model class which is used to store and fetch proposals
require 'active_record'
require 'sqlite3'
require 'logger'

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => 'conference.db'
)


ActiveRecord::Schema.define do 
  create_table :talks, :force => true do |t|
    t.string   :title
    t.integer  :time_length
    t.datetime :scheduled_at
    t.timestamps
  end
end

ActiveRecord::Base.logger = Logger.new(STDOUT)

module Conference

  class Talk < ActiveRecord::Base
    validates :title, :time_length, :presence => true
    validates :length_of_time, :on => :create
    
    before_validation :set_time_length, :if => :lightning_talk?
    
    
    def length_of_time
      if self.time_length > max_talk_time_length
        self.add(:time_length, "Can't be greater than #{ max_talk_time_length }'")
      end
    end    
    
    def scheduled?
      !scheduled_at.blank?    
    end
    
    def set_time_length
      self.time_length = 5
    end
    
    def self.lightning
      where("title like ?", '%lightning%')
    end
    
    def lightning_talk?
      self.title.match(/lightning/)
    end
    
    # Evening session = 4 hours = 4*60 = 240 mins
    def max_talk_time_length
      240
    end
    
  end
end
