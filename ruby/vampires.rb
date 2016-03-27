# Vampire Interview Questions - Ed Mechem


# How many employees?
puts "How many employees will be processed?"
how_many = gets.chomp.to_i

# Initialize counter; begin loop
counter = 0
while counter < how_many

	puts ""

	# Ask the questions
	puts "What is your name?"
	name = gets.chomp

	puts "How old are you?"
	age = gets.chomp.to_i

	puts "What year were you born?"
	birth_year = gets.chomp.to_i

	puts "Our company cafeteria serves garlic bread. Should we order some for you? (y/n)"
	garlic = gets.chomp
	if garlic == "y"
		garlic = true
	else
		garlic = false
	end

	puts "Would you like to enroll in the company’s health insurance? (y/n)"
	insurance = gets.chomp
	if insurance == "y"
		insurance = true
	else
		insurance = false
	end


	# Allergies
 	allergy = ""
	sunshine_allergy = false
 	puts "Please name any allergies, one at a time. Type \"done\" when finished."
 	while allergy != "done"
 		allergy = gets.chomp
 		if allergy == "sunshine"
 			sunshine_allergy = true
 			break
 		end
 	end




	# # Check what's been entered, by displaying it
	# puts ""
	# puts "Data entered:"
	# puts ""
	# puts "                 Name: #{name} (#{name.class.to_s})"
	# puts "                  Age: #{age} (#{age.class.to_s})"
	# puts "           Birth Year: #{birth_year} (#{birth_year.class.to_s})"
	# puts "              Garlic?: #{garlic} (#{garlic.class.to_s})"
	# puts "    Health Insurance?: #{insurance} (#{insurance.class.to_s})"
	# puts ""


	# Test age / birth_year correctness, store in boolean variable
	current_year = 2016
	delta = (current_year - birth_year)
	age_right = (delta == age || delta == (age + 1))

	# # Check it by displaying it
	# puts "Age is #{age}, Birth year is #{birth_year}? That's #{age_right}!"
	# puts ""


	# Test for obvious vampire name, store in boolean variable
	vampire_name = (name == "Drake Cula" || name == "Tu Fang")

	# # Check it by displaying it
	# puts "#{name} is a vampire name? That's #{vampire_name}."
	# puts ""


	# For convenience, test for whether they answered all of 3 key questions suspiciously:
	# (wrong age, no garlic bread, no insurance)
	# and store result in boolean variable
	very_suspicious = (!age_right && !garlic && !insurance)

	# # Check it by displaying it
	# puts "Age/year correct? #{age_right} - Garlic? #{garlic} - Insurance? #{insurance}. All 3 suspicious? #{very_suspicious}."
	# puts ""



	# Pseudocode for logic:

	# If the employee got their age right, and is willing to eat garlic bread or sign up for insurance, the result is "Probably not a vampire."
	# If the employee got their age wrong, and hates garlic bread or waives insurance, the result is "Probably a vampire."
	# If the employee got their age wrong, hates garlic bread, and doesn’t want insurance, the result is "Almost certainly a vampire."
	# Even if the employee is an amazing liar otherwise, anyone going by the name of "Drake Cula" or "Tu Fang" is clearly a vampire, because come on. In that case, you should print "Definitely a vampire."
	# Otherwise, print "Results inconclusive."


	# Note: In order to follow the instructions & match the conditions in the order
	# the assignment lists them --- BUT --- still have the logic work properly,
	# it was necessary to add
	#     && !vampire_name  (defined as: (name == "Drake Cula" || name == "Tu Fang"))
	# to the end of every condition except the last one.

	# Likewise with needing to add
	#     && !(!age_right && !garlic && !insurance)
	# to the end of the Probably condition.

	# Of course the proper way to get the logic to work would be
	# to rearrange the order of these conditions.

	# Or.....    use a case statement?  Hm..




	# OK, check it all:


	# If the employee got their age right,
	# and is willing to eat garlic bread or sign up for insurance,
	# the result is "Probably not a vampire."
	if age_right && (garlic || insurance) && !vampire_name && !sunshine_allergy
		result = "Probably not a vampire."

	# If the employee got their age wrong,
	# and hates garlic bread or waives insurance,
	# the result is "Probably a vampire."
	elsif ((!age_right && (!garlic || !insurance)) && !very_suspicious && !vampire_name) || sunshine_allergy
		result = "Probably a vampire."

	# If the employee got their age wrong,
	# hates garlic bread, and doesn’t want insurance,
	# the result is "Almost certainly a vampire."
	elsif very_suspicious && !vampire_name
		result = "Almost certainly a vampire."

	# Even if the employee is an amazing liar otherwise,
	# anyone going by the name of "Drake Cula" or "Tu Fang" is clearly a vampire,
	# because come on. In that case, you should print "Definitely a vampire."
	elsif vampire_name
		result = "Definitely a vampire."

	# Otherwise, print "Results inconclusive."
	else
		result = "Results inconclusive."

	end

	puts ""
	puts result
	puts ""

	# Increment counter
	counter += 1
# End repeat loop
end

puts "All done! We processed #{counter} employees."

