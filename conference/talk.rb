#
#Talk:
# This is a model class which is used to store and fetch proposals

require 'active_record'
require 'sqlite3'
require 'logger'



module Conference

#-----------------------------------------------------------------------------

  class Talk < ActiveRecord::Base
    validates :title, :time_length, :presence => true
    validate :length_of_time, :on => :create
    
    before_validation :set_time_length, :if => :lightning_talk?
    

    attr_accessor :scheduled_at

    def length_of_time
      if self.time_length > max_talk_time_length
        self.add(:time_length, "Can't be greater than #{ max_talk_time_length }'")
      end
    end    
    
    def already_scheduled?
      scheduled
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

    def display
      if scheduled_at
        [self.scheduled_at.to_s(:conference_time_format), self.title, (lightning_talk? ? "" : "%dmin"%self.time_length)].join(" ")
      else
        "#{ talk.title } is not scheduled"
      end
    end

  end

#-----------------------------------------------------------------------------

end
