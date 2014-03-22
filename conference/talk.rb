#
# Talk:
# This is a model class which is used to store and fetch proposals


module Conference

#-----------------------------------------------------------------------------

  class Talk < ActiveRecord::Base

    attr_accessor :scheduled_at

    before_validation :set_time_length

    validates :title, :presence => true
    validates_presence_of :time_length,  :message => "must be in mins or lightning"
    validate :length_of_time, :on => :create, :unless => lambda{|obj| obj.time_length.blank? }
    

    def length_of_time
      if self.time_length > max_talk_time_length
        self.errors.add(:time_length, "can't be greater than #{ max_talk_time_length }'")
      end
    end    
    
    def already_scheduled?
      scheduled
    end
    
    def set_time_length
      if lightning_talk?
        self.time_length = 5
      else
        self.time_length = Integer($1) if self.title.match(/([\d]+)mins?$/)
      end
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
        [self.scheduled_at.to_s(:conference_time_format), self.title].join(" ")
      else
        "#{ talk.title } is not scheduled"
      end
    end

  end

#-----------------------------------------------------------------------------

end
