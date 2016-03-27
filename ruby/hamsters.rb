# Hamster Sanctuary data entry, by Ed Mechem

# Get hamster name
puts "Type a name to give this hamster:"
hamster_name = gets.chomp

# Get volume level
puts "How loud is this hamster (1-10)?"
hamster_volume = gets.chomp
hamster_volume = hamster_volume.to_i

# Get fur color
puts "What color is this hamster's fur?"
hamster_fur_color = gets.chomp

# Get adoption candidacy evaluation
puts "Is this hamster a good candidate for adoption (y/n)?"
hamster_good_candidate = gets.chomp
if hamster_good_candidate == "y"
	hamster_good_candidate = true
else
	hamster_good_candidate = false
end

# Get estimated age
puts "Estimate this hamster's age in years (or leave blank if unsure)?"
hamster_estimated_age = gets.chomp
if (hamster_estimated_age == "")
	hamster_estimated_age = nil
else
	hamster_estimated_age = hamster_estimated_age.to_i
end

# # for testing class conversion
# puts "Volume is a #{hamster_volume.class}."
# puts "Candidacy is a #{hamster_good_candidate.class}."
# puts "Estimated Age is a #{hamster_estimated_age.class}."


# Print to console

puts ""
puts "OK, thanks for that info."
puts "Here's what we have:"
puts ""
puts "                Hamster name: #{hamster_name}"
puts "                Volume level: #{hamster_volume}"
puts "                   Fur color: #{hamster_fur_color}"
puts "    Good adoption candidate?: #{hamster_good_candidate}"
puts "               Estimated age: #{hamster_estimated_age}"
puts ""
