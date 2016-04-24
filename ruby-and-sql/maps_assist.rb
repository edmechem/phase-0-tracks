# See readme file for complete description & database schema spec.


# require gems
require 'sqlite3'


# Classes & Methods & SQL command blocks


create_trips_table_cmd == <<-SQL


SQL










# Driver code

# Create maps_assist.db (if it doesn't already exist)
db = SQLite3::Database.new("maps_assist.db")

# Create tables (if they don't already exist)



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

