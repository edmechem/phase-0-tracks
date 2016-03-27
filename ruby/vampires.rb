# Vampire Interview Questions - Ed Mechem


# Ask the questions
puts "What is your name?"
name = gets.chomp

puts "How old are you?"
age = gets.chomp

puts "What year were you born?"
birth_year = gets.chomp

puts "Our company cafeteria serves garlic bread. Should we order some for you? (y/n)"
garlic = gets.chomp

puts "Would you like to enroll in the company’s health insurance? (y/n)"
insurance = gets.chomp


# Check what's been entered (display it)
puts ""
puts "Data entered:"
puts ""
puts "                 Name: #{name}"
puts "                  Age: #{age}"
puts "           Birth Year: #{birth_year}"
puts "              Garlic?: #{garlic}"
puts "    Health Insurance?: #{insurance}"
puts ""
