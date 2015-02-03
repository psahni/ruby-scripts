module Direction

	def self.north
		North.new
	end
	
	def self.south
		South.new
	end
	
	def self.east
		East.new
	end
	
	def self.west
		West.new
	end
	
	
	class North
	
		def to_s
			"N"
		end
		
		def turn_left
			Direction.west
		end
	
		def turn_right
			Direction.east
		end
			
		def move_forward(coordinates)
			coordinates.y+=1
			coordinates
		end
		
	
	end
	
	class South
		
		def to_s
			"S"
		end
		
		def turn_left
			Direction.east
		end
		
		def turn_right
			Direction.west
		end
		
		def move_forward(coordinates)
			coordinates.y-=1
			coordinates
		end
		
	end
	
	class East

		def to_s
			"E"
		end
		
		def turn_left
			Direction.north
		end
	
		def turn_right
			Direction.south
		end
	
		def move_forward(coordinates)
			coordinates.x+=1
			coordinates
		end
		
	end
	
	class West
		
		def to_s
			"W"
		end
		
		def turn_left
			Direction.south
		end
	
		def turn_right
			Direction.north
		end

		def move_forward(coordinates)
			coordinates.x-=1
			coordinates
		end
	
	end
	 
	
end

