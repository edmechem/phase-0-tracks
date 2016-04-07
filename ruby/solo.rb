# 6.4 Solo Challenge - Designing & Implementing a Class

# Class: LED Hula Hoop
# 	Attribute: size (string)	"small" or "medium" or "large"
# 	Attribute: is_lit (boolean)	true, false
# 	Attribute: colors (array)	["red", "green", "blue", "multi"]
# 	Attribute: color (string)	(one of the above colors)

# 	Method: toggle_lights			(switches LEDs on or off)
# 	Method: change_color(new_color) (changes LED color)
# 	Method: spin					(puts "*spins hula hoop...*")
# 	Method: put_down				(puts "*puts hoop down*")

class Hoop
	attr_reader :size
	attr_accessor :is_lit, :color

	def initialize(size)
		puts "Initializing LED Hula Hoop ..."
		@size = size
		@is_lit = false
		@colors = ["red", "green", "blue", "multi"]
		@color = "red"
	end

	def toggle_lights
		@is_lit = !@is_lit
	end

	def change_color(new_color)
		@color = new_color
	end

	def spin
		puts "*spins hula hoop...*"
	end

	def put_down
		puts "*puts hoop down*"
	end

end

