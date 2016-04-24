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







# Driver code

# Create maps_assist.db (if it doesn't already exist)
db = SQLite3::Database.new("maps_assist.db")

# Create tables (if they don't already exist)
db.execute(create_locations_table_cmd)
db.execute(create_segments_table_cmd)
db.execute(create_trips_table_cmd)
db.execute(create_trips_segments_table_cmd)


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

