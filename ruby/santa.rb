class Santa

	def initialize(gender, ethnicity)
		puts "Initializing Santa instance ..."
		@gender = gender
		@ethnicity = ethnicity
		reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
		age = 0
	end

	def speak
		puts "Ho, ho, ho! Haaaappy holidays!"
	end

	def eat_milk_and_cookies(cookie_type)
		puts "That was a good #{cookie_type}!"
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
puts "Counting instances of Santa..."
santas.each_index { | idx | puts "    Santa #{idx +1} aka #{santas[idx]}"}
puts "Done."



















