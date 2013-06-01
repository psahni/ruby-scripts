 require 'date'




# Works With Rails, if you want to work with DateTime, does not works with Simple Date
#~ def distance_between(start_date, end_date)
    #~ difference = end_date.to_i - start_date.to_i  # Total Secs
    #~ seconds    =  difference % 60                 # Remaining Secs
    #~ difference = (difference - seconds) / 60      # Total Mins
    #~ minutes    =  difference % 60                 # Remaining Mins
    #~ difference = (difference - minutes) / 60      # Total Hours
    #~ hours      =  difference % 24                 # Remaining Hours
    #~ difference = (difference - hours)   / 24      # Total Days = Total Hours/24
    #~ days       =  difference % 7                  # Remaining Days
    #~ weeks      = (difference - days)    /  7      # Total Weeks
    
    #~ return "#{hours} hours, #{minutes} minutes, #{seconds} seconds"
  #~ end
  
#  distance_between(d1, d2)
 
 
 ## Simple Date Diff Ruby, works with Rails Also
 
  d1 = Date.new(2012, 05, 12)  # Also works with DateTime, d1=DateTime.now;d1.day;d1.month;d1.year
  d2 = Date.today
 
  diff = (d2-d1)   # Rational Object
 
  days = diff.to_i # Gives the no of days

 
  year = days%12 
 
  days_left = days%365
  
  months = days_left/30
  
  days_left = days_left%30
  
  
 
  puts "#{ year } year #{ months } months #{ days_left } days"

