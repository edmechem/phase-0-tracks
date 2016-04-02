# OUR METHOD DECLARATIONS

# Define method to return true if letter is vowel, false if not
def is_vowel(letter)
	vowels = 'aeiou'.chars
	vowels.index(letter) != nil
end
# test = 'b'
# p is_vowel(test)

# Define method to return next vowel
def get_next_vowel(vowel)
	return 'a' if vowel == 'u'
	vowels = 'aeiou'.chars
	vowels[vowels.index(vowel)+1]
end
# test = 'a'
# p get_next_vowel(test)

# Define method to return next consonant
def get_next_consonant(consonant)
	return 'b' if consonant == 'z'
	consonants = 'bcdfghjklmnpqrstvwxyz'.chars
	consonants[consonants.index(consonant)+1]
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


# OUR DRIVER CODE

# Get spy's real name
p 'Hello spy! Enter your real name:'
name = gets.chomp

# Swap first & last name
fake_name = name.split(' ').reverse.join(' ')
p fake_name

# Change all the vowels to the next vowel in 'aeiou',
# and all consonants to next consonant in alphabet

