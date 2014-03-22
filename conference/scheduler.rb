module Conference

#----------------------------------------------------------------------------- 

  class Scheduler


    attr_accessor :current_talk_list


    def initialize
      @current_talk_list = talks
      @morning_talk_list, @evening_talk_list = [], []
    end

    def morning_talk_list
      @morning_talk_list
    end

    def evening_talk_list
      @evening_talk_list
    end

    def schedule
      return if no_talk
      talk_list = schedule_morning_sessions()
     # p talk_list.collect(&:id)
      talk_list = schedule_evening_sessions()
      #p talk_list.collect(&:time_length)  # Only lightning talk left here
      #schedule_left_sessions()
      p "morning sessions"
      morning_talk_list.each do |list|
         p list.collect(&:id)
      end


      #p  @current_talk_list
      schedule_left_sessions() unless @current_talk_list.blank?
      #p @current_talk_list
      p 'evening sessions'
      evening_talk_list.each do |list|
         p list.collect(&:time_length)
      end
    end

    def talks
      Talk.all
    end

    def schedule_morning_sessions
     #Talk.update_all("scheduled=0")
     talks_combinations = @current_talk_list
     total_days.times do
       talks_combinations = find_possible_combination(talks_combinations, true)
       #p talks_combinations.collect(&:id)
       @morning_talk_list << talks_combinations
       talks_combinations = @current_talk_list.reject!{|talk| talks_combinations.include?(talk) } # already scheduled
     end
     talks_combinations
    end

    def schedule_evening_sessions
      talks_combinations = @current_talk_list
      total_days.times do
        talks_combinations = find_possible_combination(talks_combinations, false)
       # p talks_combinations.collect(&:time_length)
        @evening_talk_list << talks_combinations
        talks_combinations = @current_talk_list.reject!{|talk| talks_combinations.include?(talk) } # already scheduled
      end
      talks_combinations
    end

    def schedule_left_sessions()
       evening_talk_list.each do |list|
          list_time = list.inject(0){|sum, talk| sum+=talk.time_length}
          @current_talk_list.each do |talk|
            if( talk.time_length + list_time <= 240)
               list << talk
               @current_talk_list.reject!{|_talk| talk == _talk}
            end
          end
          return if @current_talk_list.blank?
       end

    end

    #
    #PRIVATE
    #

private

    # 
    #  Finding the first subarray whose sum is max_time_limit.
    #
    def find_possible_combination(talks_to_schedule, morning)
      #talks_to_schedule = talks_to_schedule.sort_by(&:time_length)
      min_time_limit = 180
      max_time_limit = morning ? 180 : 240
      talks_combinations = []
      talks_to_schedule.each do |talk|
        new_combinations = []
        new_combinations << [talk] if talk.time_length <= max_time_limit
        talks_combinations.each do |previous_combination|
          current_list = previous_combination + [ talk ]
          sum = current_list.inject(0){|accumulator, talk|accumulator+ talk.time_length}
          if sum <= max_time_limit
            new_combinations << current_list
            return current_list if sum >= min_time_limit && sum <= max_time_limit
          end
        end
        talks_combinations = talks_combinations + new_combinations
      end
      talks_combinations
    end 
  
    
    def total_days
      (total_time_of_talks/min_available_talks_time_in_a_day)
    end

    # 6 Hours = 6*60 mins
    def min_available_talks_time_in_a_day
      6*60
    end
     
    def total_time_of_talks
      talks.inject(0){|duration, talk| duration+=talk.time_length}
    end

      
    def sorted_talks
      talks.sort_by(&:time_length)
    end
          
    def no_talk
      talks.empty?
    end
     
  end

#-----------------------------------------------------------------------------

end

