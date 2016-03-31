# 5.3 Symbols and Hashes - Ed Mechem

# Release 3 - Client Details program


# Initialize empty hash, with empty keys we'll be using

client = {name: "", age: nil, children: nil, paisley: nil, argyle: nil}

# Add in details to hash (multiple puts & gets.chomp, converting data types as needed)

puts "Please enter data for this client."

puts ""
puts "Name?"
client[:name] = gets.chomp

puts ""
puts "Age?"
client[:age] = gets.chomp.to_i

puts ""
puts "Number of children?"
client[:children] = gets.chomp.to_i

puts ""
puts "Likes paisley? (y/n)"
client[:paisley] = gets.chomp
if client[:paisley] == "y"
	client[:paisley] = true
else
	client[:paisley] = false
end

puts ""
puts "Likes argyle? (y/n)"
client[:argyle] = gets.chomp
if client[:argyle] == "y"
	client[:argyle] = true
else
	client[:argyle] = false
end



# Print hash back to screen

puts ""
puts "Client data:"
puts ""
puts "      name: #{client[:name]} (#{client[:name].class})"
puts "       age: #{client[:age]} (#{client[:age].class})"
puts "  children: #{client[:children]} (#{client[:children].class})"
puts "   paisley: #{client[:paisley]} (#{client[:paisley].class})"
puts "    argyle: #{client[:argyle]} (#{client[:argyle].class})"


# Ask user to enter a key they want to change, or "none" to skip

puts ""
puts "If you'd like to change some data, enter its description (i.e. \"name\", \"age\", etc.), or enter \"none\" to continue:"
puts ""
modify = gets.chomp

if modify == "none"
	# do nothing
else
	# ask them for the new data
	puts ""
	puts "Please enter a new value for \"#{modify}\":"

	client[modify.to_sym] = gets.chomp

	#format it correctly as needed
	if modify == "paisley" || modify == "argyle"
		if client[modify.to_sym] == "y"
			client[modify.to_sym] = true
		else
			client[modify.to_sym] = false
		end
	elsif modify == "age" || modify == "children"
		client[modify.to_sym] = client[modify.to_sym].to_i
	end

end


# Print updated hash to screen, & we're done

puts ""
puts "Client data:"
puts ""
puts "      name: #{client[:name]} (#{client[:name].class})"
puts "       age: #{client[:age]} (#{client[:age].class})"
puts "  children: #{client[:children]} (#{client[:children].class})"
puts "   paisley: #{client[:paisley]} (#{client[:paisley].class})"
puts "    argyle: #{client[:argyle]} (#{client[:argyle].class})"
puts ""