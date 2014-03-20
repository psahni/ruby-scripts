# ConferenceManager
# This class is used to schedule sessions

module Conference
  class ConferenceManager

    def initialize(talks)
       @talks = talks
    end
    
    def schedule_conference
      puts "No talks found."  if no_talk
      @talks.each do |proposal|
        proposal.schedule
      end
    end
    
    def morning_session
    end
    
    def evening_session
    end
    
    def networking_time
    end
    
    def days
      total_time_in_a_day
      total_time_of_talks
    end
    

## PRIVATE
    
    private
    
    def no_talk
      @talks.empty?
    end
   
    # 6 Hours = 6*60 mins
    def total_time_in_a_day
      6*60
    end
   
    def total_time_of_talks
      @talks.inject(0){|duration, talk| duration+=talk.time_length}
    end
      
  end
end
