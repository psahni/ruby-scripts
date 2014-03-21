module Conference
  
#----------------------------------------------------------------------------- 

  module ScheduleAsssigner
    
    def schedule_morning_sessions
      max_available_time_limit = 180
      days_scheduled, total_time = 0,0
      talks_scheduled = []

      for i in 0..@talks.length-1 do
        current_time_length = 0
        start = i
        while(start <= (@talks.length-1) ) do
          start+=1
          current_time_length+=talk.time_length
          talks_scheduled << talk
          if current_time_length == max_available_time_limit 
            break
          end
        end
      end
#      @talks.each do |talk|
#        next if talk.scheduled?
#        if((talk.time_length > max_available_time_limit) || ((talk.time_length + total_time) > max_available_time_limit) )
#          next
#        end
#        total_time+=talk.time_length
#        if total_time == max_available_time_limit
#        end
#      end  
    end
  
    
    # 
    # Finding the first subarray whose sum is k.
    #
    def find_possible_combination(talks, time_limit)
      current_time_length, start = 0,0
      for i in 0..(@talks.length-1) do
        
      end
    end 
  
    private
    
    def total_days
      (total_time_of_talks/min_available_talks_time_in_a_day)
    end

    # 6 Hours = 6*60 mins
    def min_available_talks_time_in_a_day
      6*60
    end
     
    def total_time_of_talks
      @talks.inject(0){|duration, talk| duration+=talk.time_length}
    end
    
  end #TimeSlotAsssigner
 
#----------------------------------------------------------------------------- 

  class Scheduler

    
    def initialize
      @talks = Talk.all
    end
    
    def schedule
      return if no_talk
      #sorted_talks.each do |talk|
      #  assign_time_slot(talk)
      #end 
      #find_possible_comb_session(talks, days)
      schedule_morning_sessions()
    end
    
#  
#PRIVATE
#

  private
      
    def sorted_talks
      @talks.sort_by(&:time_length)
    end
          
    def no_talk
      @talks.empty?
    end
     
  end

#-----------------------------------------------------------------------------

end

#    min_session_time_limit = 180
#     max_session_time_limit = 240
#     if morning_session
#      max_session_time_limit = min_session_time_limit
#     end
#     talk_list_size = talks.size()
#     possible_combination_of_talks = []
#     possible_combination_count = 0
#      for i in 0..(talk_list_size-1) do
#        start_point = i
#        total_time = 0
#        possible_combination_list = []
#        while(start_point < talk_list_size)
#          current_talk = talks[start_point]
#          if current_talk.scheduled?
#            next
#          end
#          if(current_talk.time_length > max_session_time_limit || (current_talk.time_length+total_time) > max_session_time_limit )
#            next
#          end
#          possible_combination_of_talks << current_talk
#          total_time+=current_talk.time_length
#          
#          if(morning_session)
#            if(total_time == max_session_time_limit)
#             break
#            end
#          else
#            if(total_time >= min_session_time_limit)
#              break
#            end
#          end          
#        end
#      end

