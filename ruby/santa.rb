class Santa
	# Release 3, refactored using attr_reader
	attr_reader :gender, :ethnicity, :reindeer_ranking
	attr_accessor :age

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

	# This was Release 2, but we've refactored it for Release 3
	# def celebrate_birthday=(unneeded_var)
	# 	@age += 1
	# end

	# New Release 3 code, takes an integer & adds (or subtracts!) it from age
	# We'll just presume this is usually called with the ingeger "1"
	# This takes advantage of attr_accessor
	def celebrate_birthday=(years)
		@age += years
	end


	def get_mad_at(reindeer_name)
		@reindeer_ranking.delete(reindeer_name)
		@reindeer_ranking.push(reindeer_name)
	end



	# These were Release 2 methods; they're no longer needed
	# after the Release 3  refactoring

	# # getter methods
	# def gender
	# 	@gender
	# end

	# def ethnicity
	# 	@ethnicity
	# end

	# # getter method to test celebrate_birthday method...
	# def age
	# 	@age
	# end

	# # getter method to test get_mad_at method...
	# def reindeer_ranking
	# 	@reindeer_ranking
	# end
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


# # Release 1 through 3
# santas = []
# new_santa_data = [
# 	["bigender", "Icelandic"],
# 	["gender fluid", "black"],
# 	["female", "prefer not to say"],
# 	["agender", "N/A"],
# 	["N/A", "white"],
# 	["male", "Peruvian"]
# ]
# new_santa_data.each { | data | santas.push( Santa.new(data[0], data[1]) ) }
# puts ""

# Release 4: Build Many, Many Santas!
many = 500
santas = []
genders = ["agender", "female", "bigender", "male", "female", "gender fluid", "N/A"]
ethnicities = ["black", "Latino", "white", "Japanese-African", "prefer not to say", "Mystical Creature (unicorn)", "N/A", "Icelandic", "Peruvian", "Lithuanean", "Latvian", "slavic", "Inuit", "Ohlone", "asian", "mixed ethnicity", "Viking", "pony"]
many.times do
	santas.push( Santa.new( genders.sample, ethnicities.sample ) )
end

# Set age to random number between 0 and 140
santas.each { | santa | santa.age = Random.rand(0..140)}


# puts "Testing Release 1 - Counting instances of Santa..."
# santas.each_index { | idx | puts "    Santa #{idx +1} aka #{santas[idx]}"}
# puts "Done."
# puts ""

# # Test Release 2 (getter methods)
# puts "Testing Release 2..."
# puts ""
# puts "Here's the Santas' genders & ethnicities:"
# santas.each_index { | idx | puts "    Santa #{idx +1}'s gender is \"#{santas[idx].gender}\"; their ethnicity is \"#{santas[idx].ethnicity}\""}
# puts ""

# Test Release 4 (Many, Many Santas!)
puts "Testing Release 4..."
puts ""
puts "Here's the Santas' genders & ethnicities:"
santas.each_index { | idx | puts "  #{idx +1}: gender \"#{santas[idx].gender}\", ethnicity: \"#{santas[idx].ethnicity}\", age: #{santas[idx].age}"}
puts ""


# # Test Release 2, celebrate_birthday setter method
# puts "Let's age Santa 3 by 5 years!!!!!"
# puts "    Santa 3's original age is: #{santas[2].age}"
# 5.times { santas[2].celebrate_birthday = nil }
# puts "    Santa 3's new age is: #{santas[2].age}!"
# puts ""

# Test Release 3, refactored celebrate_birthday method (uses attr_accessor)
puts "Let's age Santa 3 by 5 years!!!!!"
puts "    Santa 3's original age is: #{santas[2].age}"
5.times { santas[2].celebrate_birthday = 1 }
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
