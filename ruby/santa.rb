class Santa

	def initialize(gender, ethnicity)
		puts "Initializing Santa instance ..."
		@gender = gender
		@ethnicity = ethnicity
		@reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
		@age = 0
	end

	def speak
		puts "Ho, ho, ho! Haaaappy holidays!"
	end

	def eat_milk_and_cookies(cookie_type)
		puts "That was a good #{cookie_type}!"
	end

	# setter methods
	def celebrate_birthday=(unneeded_var)
		@age += 1
	end

	def get_mad_at(reindeer_name)
		@reindeer_ranking.delete(reindeer_name)
		@reindeer_ranking.push(reindeer_name)
	end

	# getter methods
	def gender
		@gender
	end

	def ethnicity
		@ethnicity
	end

	# getter method to test celebrate_birthday method...
	def age
		@age
	end

	# getter method to test get_mad_at method...
	def reindeer_ranking
		@reindeer_ranking
	end
end


# # Release 0
# santa1 = Santa.new

# puts ""
# puts "Hey, Santa - say something!"
# santa1.speak

# cookie_type = "graham cracker"
# puts ""
# puts "Here, Santa - enjoy this #{cookie_type} :)"
# santa1.eat_milk_and_cookies(cookie_type)

# puts ""


# Release 1
santas = []
new_santa_data = [
	["bigender", "Icelandic"],
	["gender fluid", "black"],
	["female", "prefer not to say"],
	["agender", "N/A"],
	["N/A", "white"],
	["male", "Peruvian"]
]
new_santa_data.each { | data | santas.push( Santa.new(data[0], data[1]) ) }
puts ""

# puts "Testing Release 1 - Counting instances of Santa..."
# santas.each_index { | idx | puts "    Santa #{idx +1} aka #{santas[idx]}"}
# puts "Done."
# puts ""


puts "Testing Release 2..."
puts ""

# Test Release 2, getter methods
puts "Here's the Santas' gender & ethnicities:"
santas.each_index { | idx | puts "    Santa #{idx +1}'s gender is \"#{santas[idx].gender}\"; their ethnicity is \"#{santas[idx].ethnicity}\""}
puts ""

# Test Release 2, celebrate_birthday setter method
puts "Let's age Santa 3 by 5 years!!!!!"
puts "    Santa 3's original age is: #{santas[2].age}"
5.times { santas[2].celebrate_birthday = nil }
puts "    Santa 3's new age is: #{santas[2].age}!"
puts ""

# Test Release 2, get_mad_at setter method
bad_reindeer = "Vixen"
puts "Uh, oh - Santa 1 is about to get mad at #{bad_reindeer}!"
puts "Current ranking is #{santas[0].reindeer_ranking}."
puts ""
santas[0].get_mad_at(bad_reindeer) 
puts "Now they've done it! Santa 1 is hopping mad at #{bad_reindeer}!!!"
puts "New ranking is #{santas[0].reindeer_ranking}!"
puts ""
