require_relative './rover'

class Main

	def self.run!
		rover1 = Rover.new(Coordinates.new(1,2), 'N', 'LMLMLMLMM')
		                                  # Start coordinates
                                      # Direction
                                      # Instruction
		puts "Input: " + rover1.current_position
		rover1.process_instruction_array

		rover2 = Rover.new(Coordinates.new(3,3), 'E', 'MMRMMRMRRM')
		
		puts "Input: " + rover2.current_position
		rover2.process_instruction_array
		
		puts "Output: " + rover1.current_position
		puts "Output: " + rover2.current_position
	end
	
	
end

Main.run!


# 3 Classes used
# 1. Rover
# 2. Coordinates
# 3. Direction
