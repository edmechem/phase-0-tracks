# OUR METHOD DECLARATIONS

# Define method to return true if letter is vowel, false if not
def is_vowel (letter)
	vowels = 'aeiou'.chars
	vowels.index(letter) != nil
end
# test = 'b'
# p is_vowel(test)

# Define method to return next vowel
def get_next_vowel (vowel)
	return 'a' if vowel == 'u'
	vowels = 'aeiou'.chars
	vowels[ vowels.index(vowel) + 1 ]
end
# test = 'a'
# p get_next_vowel(test)

# Define method to return next consonant
def get_next_consonant (consonant)
	return 'b' if consonant == 'z'
	consonants = 'bcdfghjklmnpqrstvwxyz'.chars
	consonants[ consonants.index(consonant) + 1 ]
end
# very similar to get next vowel

# Define method to return swapped character,
# i.e. next vowel or next consonant, as appropriate
def get_swapped_char (letter)
	if is_vowel(letter)
		get_next_vowel(letter)
	else
		get_next_consonant(letter)
	end
end
# p 'Enter a character'
# test = gets.chomp
# p get_swapped_char(test)


# Define method to swap first & last name and change characters,
# generating fake name

def make_fake_name (name)
	# Swap first & last name
	swap_name = name.split(' ').reverse.join(' ')

	# Swap characters - change all vowels to next vowel,
	# and all consonants to next consonant

	# Initialize fake_name & index (counter) variables 
	fake_name = ''
	index = 0
	while index < swap_name.length
		char = swap_name[index]

		# For each character
		if char == ' '
			# If space, add space
			fake_name += ' '
		else
			# Handle lower & uppercase properly
			if char == char.downcase
				fake_name += get_swapped_char(char)
			else
				fake_name += get_swapped_char(char.downcase).upcase
			end
		end

		# Increment counter
		index += 1
	end

	fake_name
end




# OUR DRIVER CODE

# Begin, greeting
puts "Hello spy! Let's create some fake names."

# Loop until they type 'quit' to quit
done = false
until done do

	# Get the spy's real name
	puts ""
	puts "Enter a real name (or 'quit' when done):"
	name = gets.chomp

	if name == 'quit'
		# Done
		puts ""
		puts "OK, we're done!"
		done = true
	else
		# Make fake name
		fake_name = make_fake_name(name)
		puts "#{name} is also known as #{fake_name}"
	end 

end
