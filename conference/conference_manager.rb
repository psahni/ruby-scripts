# ConferenceManager
# This class is used to schedule sessions

module Conference
  class ConferenceManager

    def initialize
       @scheduler = Scheduler.new
    end
    
    def schedule_conference
      @scheduler.schedule
    end
    
    def morning_session
    end
    
    def evening_session
    end
    
    def networking_time
    end
    
   
    
  end
end
