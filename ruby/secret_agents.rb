# 4.6 - More Methods
# Three way pairing: Ed Mechem & Angelo Deleon (navigators) w/ Danny Pham (driver)

# 1. encrypt
# advance each letter forward
# if letter "z" then change it to letter "a"
# 2. decrypt
# reverse the process above

def encrypt(message)
	counter = 0
	encrypted = ""
	while counter < message.length
		encrypted += message[counter].next[0]
		counter += 1
	end
	return encrypted
end

def decrypt(message)
	message = message.downcase
	all_letters = "abcdefghijklmnopqrstuvwxyz"
	counter = 0
	decrypted = ""
	while counter < message.length
		current_letter = message[counter]
		if current_letter == "!"
			decrypted += " "
		else 
			current_letter_index = all_letters.index(current_letter)
			current_letter_index -= 1		
#		p all_letters[current_letter_index]
			decrypted += all_letters[current_letter_index]	
		end	
		counter += 1
	end
	return decrypted
end

#p decrypt(encrypt("The duck flies at midnight"))

#Message for future agents:
#when encrypting/decrypting use only a-z and " ". All cases will be lower case.


#Asks a secret agent (the user) whether they would like to decrypt or encrypt a password

p "Would you like to encrypyt or decrypt? (e/d)"
action = gets.chomp

#Asks them for the password

p "What is the password? (only lower case a-z and NO BLANK SPACES)"
password = gets.chomp

#Conducts the requested operation, prints the result to the screen, and exits

if action == "e"
	p "This is your encrypted password: #{encrypt(password)}"
else
	p "This is your decrypted password: #{decrypt(password)}"
end