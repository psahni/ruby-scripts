require_relative './coordinates'
require_relative './direction'

class Rover

	attr_accessor :instructions_string, :rover_coordinates, :direction
	
	def initialize(current_position, start_direction, instructions_string)
		@position            = current_position
		@instructions_string = instructions_string
		@direction           = get_direction(start_direction)
	end
	
	
	def process_instruction_array
		@instructions_string.split('').each do |_instruction|	
			process_instruction(_instruction)		
		end
	end
	
	def current_position
		"#{ @position.x } #{ @position.y } #{ @direction.to_s }"
	end
	
	
	def direction
		@direction
	end
	
	def process_instruction(instruction)
		case instruction
			when 'R'
  			@direction = direction.turn_right
  		when 'L'
  			@direction = direction.turn_left
  		when 'M'
  		 @position = direction.move_forward(@position)
		end		
	end
	
	
	private
	
	def get_direction(start_direction)
		case start_direction
			when 'N'
				Direction.north
			when 'S'
				Direction.south
			when 'E'
				Direction.east
			when 'W'
				Direction.west
			else
				raise "Unknown Direction"
		end
	end
	
end

