class Puppy

	# Release 1
	def initialize
		puts "Initializing new puppy instance..."
	end

	def fetch(toy)
	puts "I brought back the #{toy}!"
	toy
	end

	def speak(integer)
	integer.times { puts "Woof!" }
	end

	def roll_over
	puts "*rolls over*"
	end

	def dog_years(integer)
	integer * 7
	end

	def sit
	puts "*sits*"
	end

end

class Kitten

	def initialize
		puts "Initializing new kitten instance..."
	end

	def sleep
		puts "*sleeps..... zzzzz...*"
	end

	def chases_tail
		puts "*chases tail*"
	end

end


# Release 0 
test = Puppy.new
p test.fetch("ball")
p test.speak(5)
p test.roll_over
p test.dog_years(2)
p test.sit

# Release 2

# Loop 50 times, make 50 new kittens
kittens = []
index = 0
while index < 50
	# Modify it so they all get put into a data structure
	kittens.push(Kitten.new)
	index += 1
end
# p kittens

# Iterate using each, call the instance methods we wrote.
kittens.each do | kitten |
	kitten.sleep
	kitten.chases_tail
end
