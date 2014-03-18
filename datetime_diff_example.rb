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


## Calculating age
def age
  now = Time.now.utc.to_date
  now.year - birthday.year - (birthday.to_date.change(:year => now.year) > now ? 1 : 0)
end


#irb(main):015:0> t2 = Time.parse("28/02/2014")
#=> 2014-02-28 00:00:00 +0530
#irb(main):016:0> t1 = Time.parse("05/12/1984")
#=> 1984-12-05 00:00:00 +0530
#irb(main):017:0> (t2-t1).to_i
#=> 922492800
#irb(main):018:0> (t2-t1).to_i/(365)
#=> 2527377
#irb(main):019:0> (t2-t1).to_i/(365*24)
#=> 105307
#irb(main):020:0> (t2-t1).to_i/(365*24*60)
#=> 1755
#irb(main):021:0> (t2-t1).to_i/(365*24*60*60)
#=> 29
#irb(main):022:0> 

