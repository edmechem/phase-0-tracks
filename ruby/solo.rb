# 6.4 Solo Challenge - Designing & Implementing a Class
# Class: LED Hula Hoop

# 	Attribute: size (string)			"sm" or "med" or "lg"
# 	Attribute: color (string)			"red" or "green" or "blue" or "multi"
# 	Attribute: brightness (integer)		1 or 2 or 3

# 	Attribute: state 					"down" or "up" or "spinning"
# 	Attribute: spin_counter				int
	
# 	Method: pick_up						(puts "*picks up hoop*")
# 	Method: spin(int)					(int.times puts "*spins hula hoop...*")
# 	Method: put_down					(puts "*puts hoop down*")


class Hoop
	attr_reader :size, :spin_counter
	attr_accessor :color, :brightness, :state

	def initialize(size, color, brightness)
		# puts "Initializing LED Hula Hoop ..."
		@size = size
		@color = color
		@brightness = brightness

		@state = "down"
		@spin_counter = 0
	end

	def pick_up
		puts "*picks up hoop*"
		@state = "up"
	end

	def spin(int)
		int.times { puts "*spins hula hoop...*" }
		@state = "spinning"
		@spin_counter += int
	end

	def put_down
		puts "*puts hoop down*"
		@state = "down"
	end

end

puts "Hi! Let's make some LED Hula Hoops :)"
puts "For each hoop you'll choose size, color & brightness."
puts "OK, let's get started."
puts ""

# Loop thru, creating hoops of user chosen size, color & brightness
hoops = []
done = false
until done

	# Ask for attributes
	puts ""
	puts "Hoop ##{hoops.length+1}: What size ('sm', 'med', 'lg' - or return for 'med')?"
	size = gets.chomp
	if size == ""
		size = 'med'
	end

	puts "What color ('red', 'green', 'blue', 'multi' - or return for 'multi')?"
	color = gets.chomp
	if color == ""
		color = 'multi'
	end

	puts "Brightness level? (1, 2, 3, - or return for 2)?"
	brightness = gets.chomp.to_i
	if brightness == ""
		brightness = 2
	end
	

	# Display the input
	puts "Got it, that's one #{size} size hoop, #{color} color, brightness: #{brightness}"
	
	# Make new hoop, add it to array of hoops
	hoops << Hoop.new(size, color, brightness)

	# Ask if they want to continue
	puts "Hit return to make another, or 'done' to stop"
	continue = gets.chomp
	if continue == 'done'
		done = true
	end
end

# Print out attributes of the hoop
puts ""
puts "OK, that's #{hoops.length} hoops:"
hoops.each_index { | idx | puts "  ##{idx+1}: #{hoops[idx].size} size, #{hoops[idx].color} color, brightness: #{hoops[idx].brightness}"}
puts ""



# Extra credit, because... 
# Make hoops, but not play with them? That would be crazy!

# First, ask them which one they want to play with
puts ""
puts "Which hoop would you like to play with?"
puts "Type a number from 1 to #{hoops.length}:"
which_hoop = gets.chomp.to_i
hoop = hoops[which_hoop - 1]
puts ""
puts "Great choice! That's hoop ##{which_hoop}:"
puts "  #{hoop.size}, #{hoop.color}, brightness: #{hoop.brightness}"

# Let them change color or brightness if they want to
puts ""
puts "Would you like to change color or brightness?"
puts "Type 'color' or 'brightness' or hit return to play with this hoop as is"
change_attr = gets.chomp
if change_attr == ""
	# do nothing
else
	if change_attr == 'color'
		puts "Enter a new value for color ('red', 'green', 'blue', or 'multi'):"
		hoop.color = gets.chomp

	elsif change_attr == 'brightness'
		puts "Enter a new value for brightness (1, 2, or 3):"
		hoop.brightness = gets.chomp.to_i
	end
	puts ""		
	puts "OK, your hoop attributes are now:"
	puts "  #{hoop.size}, #{hoop.color}, brightness: #{hoop.brightness}"
end

# OK, let's play
puts ""
puts "OK, let's play!"

# Loop until they're done
# Check state, prompt appropriately, respond to their input appropriately
done = false
until done
	if hoop.state == "down"
		puts ""
		puts "Hit return to pick up the hoop, or type 'done' to stop"

		input = gets.chomp
		if input == 'done'
			done = true
		else
			hoop.pick_up
		end

	else
		puts ""
		if hoop.state == "up"
			prompt = "Type a number to spin hoop that many times,"
		elsif hoop.state == "spinning"
			prompt = "Type a number to keep spinning hoop that many times,"
		end
		puts prompt
		puts "or type 'down' to put the hoop down" 

		input = gets.chomp
		if input == 'down'
			hoop.put_down
		else
			hoop.spin(input.to_i)
		end
	end	
end

# Goodbye
puts ""
puts "Whew, that was fun!!"
puts "You spun the hoop #{hoop.spin_counter} times!"
puts "Bye!"
puts ""

