#
# ConferenceManager
# This class is used to schedule talks with the help of schedular class
#

module Conference

#------------------------------------------------------------------------------------------------------------

  class ConferenceManager

    def initialize
       @scheduler = Scheduler.new
    end
    
    def schedule_conference
      @scheduler.schedule
    end

    def display_conference_schedule
      @scheduler.total_days.times do |i|
        scheduled_at = Time.new(2014, 4, 1, 9, 0, 0)
        puts "Track #{ i + 1}:"

        # Morning schedule
        talk_list = @scheduler.morning_talk_list[i]
        talk_list.each do |talk|
          talk.scheduled_at = scheduled_at
          puts talk.display
          scheduled_at = scheduled_at + talk.time_length*60
        end

        puts "#{ scheduled_at.to_s(:conference_time_format)} Lunch"
        scheduled_at = scheduled_at + 60*60

        # Evening Schedule
        talk_list = @scheduler.evening_talk_list[i]
        talk_list.each do |talk|
          talk.scheduled_at = scheduled_at
          puts talk.display
          scheduled_at = scheduled_at + talk.time_length*60
        end

        puts "#{ scheduled_at.to_s(:conference_time_format)} Networking Event"
      end
    end

  end
#------------------------------------------------------------------------------------------------------------

end
