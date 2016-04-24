# See readme file for complete description & database schema spec.


# require gems
require 'sqlite3'


# SQL command blocks & Classes & Methods

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
		update_all
	end

	# Ugh - need to "de-array-ify" the result, *TWICE*,
	# just to get the actual FixNum
	def update_trips
		@trips_count = @db.execute("SELECT COUNT(*) FROM trips")[0][0]
	end

	def update_segments
		@segments_count = @db.execute("SELECT COUNT(*) FROM segments")[0][0]
	end

	def update_locations
		@locations_count = @db.execute("SELECT COUNT(*) FROM locations")[0][0]
	end

	def update_all
		update_trips
		update_segments
		update_locations
	end
end



# # Method to count how many rows in each
# def get_locations(db)
#   db.execute("SELECT * FROM locations")
# end



# Driver code

# Create maps_assist.db (if it doesn't already exist)
db = SQLite3::Database.new("maps_assist.db")

# Create tables (if they don't already exist)
# uncomment when done; commented for now for speed
# db.execute(create_locations_table_cmd)
# db.execute(create_segments_table_cmd)
# db.execute(create_trips_table_cmd)
# db.execute(create_trips_segments_table_cmd)

# Create one & only instance of our "Status" class :)
status = Status.new(db)


# # test code print UI state & count of rows in tables
# puts "UI State is: #{status.ui_state}"
# puts "Number of trips: #{status.trips_count} Class: #{status.trips_count.class}"
# puts "Number of segments: #{status.segments_count} Class: #{status.segments_count.class}"
# puts "Number of locations: #{status.locations_count} Class: #{status.locations_count.class}"





# Main Menu - Ask what user wants to do. Choices are:
#     (T)rips (# of existing), (S)egments (# of existing), (L)ocations (# of existing), (Q)uit.

# Trips Menu - Display trips, in numbered list.
# Prompt user to select a trip by typing its number.
# After they do so, ask what to do. Choices are:
#     (M)ap it, (C)hange it, (D)elete it, (N)ew Trip, (B)ack to Main
#         (if no trips, menu will only show (N)ew Trip & (B)ack to Main)

# Segments Menu - Display segments, in numbered list.
# Prompt user to select a segment by typing its number.
# After they do so, ask what to do. Choices are:
#     (M)ap it, (C)hange it, (D)elete it, (N)ew Segment, (B)ack to Main
#         (if no segments, menu will only show (N)ew Segment & (B)ack to Main)

# Locations Menu - Display locations, in numbered list.
# Prompt user to select a location by typing its number.
# After they do so, ask what to do. Choices are:
#     (M)ap it, (C)hange it, (D)elete it, (N)ew Location, (B)ack to Main
#         (if no locations, menu will only show (N)ew Location & (B)ack to Main)

