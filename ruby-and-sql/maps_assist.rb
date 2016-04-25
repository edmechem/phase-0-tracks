# See readme file for complete description & database schema spec.


# require gems
require 'sqlite3'

# so we can get console width, so we can center output nicely
require 'io/console'

# SQL command blocks

create_locations_table_cmd = <<-SQL
  CREATE TABLE IF NOT EXISTS locations(
    id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    address VARCHAR(255),
    by_zip BOOLEAN,
    zip INT,
    city VARCHAR(255),
    state VARCHAR(255)
  )
SQL

create_segments_table_cmd = <<-SQL
  CREATE TABLE IF NOT EXISTS segments(
    id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    mode VARCHAR(255),
    source_location_id INT,
    destination_location_id INT,
    FOREIGN KEY (source_location_id) REFERENCES locations(id),
    FOREIGN KEY (destination_location_id) REFERENCES locations(id)
  )  
SQL

create_trips_table_cmd = <<-SQL
  CREATE TABLE IF NOT EXISTS trips(
    id INTEGER PRIMARY KEY,
    name VARCHAR(255)
  )
SQL

create_trips_segments_table_cmd = <<-SQL
  CREATE TABLE IF NOT EXISTS trips_segments(
    id INTEGER PRIMARY KEY,
    trip_id INT,
    segment_id INT,
    FOREIGN KEY (trip_id) REFERENCES trips(id),
    FOREIGN KEY (segment_id) REFERENCES segments(id)
  )
SQL


# Awesome, found here: https://www.ruby-forum.com/topic/106133
# So, Screen.clear will clear the screen
module Screen
	def self.clear
       print "\e[2J\e[f"
    end
end


# Define Classes & Methods

# Class Status, keeps track of:
#    Current UI state (are we showing info for Main, Trip, Segment, or Location)
#    Current count of rows, in each of three tables (to display in UI Menus)
#    We will only ever create one instance of this class.
class Status

	attr_reader :trips_count, :segments_count, :locations_count
	attr_accessor :ui_state

	def initialize(db)
		@db = db
		@ui_state = "Main"
		update_table_counts
	end

	# Ugh - need to "de-array-ify" the result, *TWICE*,
	# just to get the actual FixNum
	def update_trips_count
		@trips_count = @db.execute("SELECT COUNT(*) FROM trips")[0][0]
	end

	def update_segments_count
		@segments_count = @db.execute("SELECT COUNT(*) FROM segments")[0][0]
	end

	def update_locations_count
		@locations_count = @db.execute("SELECT COUNT(*) FROM locations")[0][0]
	end

	def update_table_counts
		update_trips_count
		update_segments_count
		update_locations_count
	end
end


# Display the header that comes at the top of the screen,
# before the various Menu Screens

def	display_header(ui_state, term_width)
	Screen.clear
	puts ""
	puts "+-----------------------+".center(term_width)
	puts "|      Maps Assist      |".center(term_width)
	puts "+-----------------------+".center(term_width)
	puts ""
	puts ""

	if ui_state == "Main"	
		puts (ui_state + " Menu").center(term_width)
	else
		puts (ui_state).center(term_width)
	end
	puts ""
end

def	display_menu(ui_state, the_menu, term_width)

	# get widest menu item, to nicely lay them out
	# left aligned but overall centered
	widest = 0
	i = 0
	while i < the_menu.count
		if the_menu[i].length > widest
			widest = the_menu[i].length
		end
		i += 1
	end

	# ok, display the menu
	the_menu.each{ | item | puts item.ljust(widest).center(term_width)}
end


def display_count(ui_state, term_width, db)
	
	# grab count of items
	count_cmd = "SELECT COUNT(*) FROM " + ui_state.downcase
	count = db.execute(count_cmd)[0][0]

	# display it
	puts "There are #{count} #{ui_state.downcase}.".ljust(24).center(term_width)
	puts ""

end

def display_items(ui_state, term_width, db)
	
	# grab count of items
	count_cmd = "SELECT COUNT(*) FROM " + ui_state.downcase
	count = db.execute(count_cmd)[0][0]

	# display it
	puts "There are #{count} #{ui_state.downcase}."
	puts "Hit any key to continue..."
	gets
	# trips = db.execute(
	# 	"SELECT * FROM trips"
	# )
	# trips.each { | trip | puts "Trip info: #{trip}"}
end








# Driver code

# Create maps_assist.db (if it doesn't already exist)
db = SQLite3::Database.new("maps_assist.db")

# Create tables (if they don't already exist)
db.execute(create_locations_table_cmd)
db.execute(create_segments_table_cmd)
db.execute(create_trips_table_cmd)
db.execute(create_trips_segments_table_cmd)

# Create one & only instance of our "Status" class :)
# This declares & populates our three table count variables,
# as well as setting ui_state to "Main"
status = Status.new(db)

# Get terminal width, so output can be centered
# Just for centering...  we'll presume at least 60 chars
# It'll just look ugly if it's too narrow
# Rounded down to closest even number
term_width = IO.console.winsize[1]
if term_width.odd?
	term_width -=1
end


# test code, to print UI state & table counts
# puts "UI State is: #{status.ui_state}"
# puts "Number of trips: #{status.trips_count} Class: #{status.trips_count.class}"
# puts "Number of segments: #{status.segments_count} Class: #{status.segments_count.class}"
# puts "Number of locations: #{status.locations_count} Class: #{status.locations_count.class}"

# puts ""
# puts "Term width: #{term_width}"
# puts ""
# puts "Hit return to continue..."
# gets.chomp


# Declare hash of arrays containing menu items to display
menus = {
	"Main" => [
		"(T)rips",
		"(S)egments",
		"(L)ocations",
		"",
		"(B)ack to Main Menu",
		"(Q)uit"
	],
	"Trips" => [
		"(M)ap a trip",
		"(E)dit a trip",
		"(D)elete a trip",
		"",
		"(N)ew trip",
		"",
		"(B)ack to Main Menu",
		"(Q)uit"
	],
	"Segments" => [
		"(M)ap a segment",
		"(E)dit a segment",
		"(D)elete a segment",
		"",
		"(N)ew segment",
		"",
		"(B)ack to Main Menu",
		"(Q)uit"
	],
	"Locations" => [
		"(M)ap a location",
		"(E)dit a location",
		"(D)elete a location",
		"",
		"(N)ew location",
		"",
		"(B)ack to Main Menu",
		"(Q)uit"
	]
}

# Declare hash of valid input
valid_inputs = {
	"Main" => "tslbq",
	"Trips" => "mednbq",
	"Segments" => "mednbq",
	"Locations" => "mednbq",
}

# Declare hash of inputs => actions
actions = {
	"m" => "Map",
	"e" => "Edit",
	"d" => "Delete",
	"n" => "New",
}


# Main "event loop". Do all the stuff here,
# until user indicates done by entering q (for Quit).
done = false
until done

	# Select status-appropriate menu
	the_menu = menus[status.ui_state]
	
	# Clear screen & display header
	display_header(status.ui_state, term_width)

	# If it's not "Main", then show how many of the item in question there are
	if status.ui_state != "Main"
		display_count(status.ui_state, term_width, db)
	end

	# Display the appropriate menu, in appropriate width for terminal window
	display_menu(status.ui_state, the_menu, term_width)
	
	# Grab their input.
	puts ""
	puts ""
	puts "Enter your choice then hit return:"
	input = gets.chomp.byteslice(0)

	# process input & test for validity
	if input == nil
		valid = false
	else
		input = input.downcase
		if valid_inputs[status.ui_state].index(input) == nil
			valid = false
		else
			valid = true
		end
	end
	
	# branch properly on invalid input, or quit, or do the thing
	if !valid
		# puts "Valid input for #{status.ui_state} is: '#{valid_inputs[status.ui_state]}'."
		# puts "You entered #{input}, whose validity is #{valid}."
		# puts "Please try again. Hit any key to continue..."
		puts "Invalid input, please try again. Hit any key to continue..."
		gets
	elsif input == "q"
		done = true
		puts ""
		puts "Bye!!!"
		puts ""
	else
		# puts "Valid input for #{status.ui_state} is: '#{valid_inputs[status.ui_state]}'"
		# puts "You entered #{input}, whose validity is #{valid}."
		# puts "Hit any key to continue..."
		# gets

		if input == "b"
			status.ui_state = "Main"
			# nothing else, we're done

		elsif input == "t"
			status.ui_state = "Trips"
			# nothing else, we're done

		elsif input == "s"
			status.ui_state = "Segments"
			# nothing else, we're done

		elsif input == "l"
			status.ui_state = "Locations"
			# nothing else, we're done

		elsif (input == "m" || input == "e" || input == "d" || input == "n")
			action = actions[input]
			puts "#{action} a #{status.ui_state.downcase.chop}".ljust(40).center(term_width)
			
			gets




		end
	end

    

end





# Main Menu - Ask what user wants to do. Choices are:
#     (T)rips (# of existing), (S)egments (# of existing), (L)ocations (# of existing), (Q)uit.

# Trips Menu - Display trips, in numbered list.
# Prompt user to select a trip by typing its number.
# After they do so, ask what to do. Choices are:
#     (M)ap it, (E)dit, (D)elete, (N)ew Trip, (B)ack to Main
#         (if no trips, menu will only show (N)ew Trip & (B)ack to Main)

# Segments Menu - Display segments, in numbered list.
# Prompt user to select a segment by typing its number.
# After they do so, ask what to do. Choices are:
#     (M)ap it, (E)dit, (D)elete, (N)ew Segment, (B)ack to Main
#         (if no segments, menu will only show (N)ew Segment & (B)ack to Main)

# Locations Menu - Display locations, in numbered list.
# Prompt user to select a location by typing its number.
# After they do so, ask what to do. Choices are:
#     (M)ap it, (C)hange it, (D)elete it, (N)ew Location, (B)ack to Main
#         (if no locations, menu will only show (N)ew Location & (B)ack to Main)

