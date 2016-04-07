class Santa

	def initialize
		puts "Initializing Santa instance ..."
	end

	def speak
		puts "Ho, ho, ho! Haaaappy holidays!"
	end

	def eat_milk_and_cookies(cookie_type)
		puts "That was a good #{cookie_type}!"
	end

end

santa1 = Santa.new

puts ""
puts "Hey, Santa - say something!"
santa1.speak

cookie_type = "graham cracker"
puts ""
puts "Here, Santa - enjoy this #{cookie_type} :)"
santa1.eat_milk_and_cookies(cookie_type)

puts ""
