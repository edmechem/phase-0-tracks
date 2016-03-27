# Hamster Sanctuary data entry, by Ed Mechem

# Get hamster name
puts "Type a name to give this hamster:"
hamster_name = gets.chomp

# Get volume level
puts "How loud is this hamster (1-10)?"
hamster_volume = gets.chomp

# Get fur color
puts "What color is this hamster's fur?"
hamster_fur_color = gets.chomp

# Get adoption candidacy evaluation
puts "Is this hamster a good candidate for adoption (y/n)?"
hamster_good_candidate = gets.chomp

# Get estimated age
puts "Estimate this hamster's age in years (or leave blank if unsure)?"
hamster_estimated_age = gets.chomp
if (hamster_estimated_age == "")
	hamster_estimated_age = nil
end
