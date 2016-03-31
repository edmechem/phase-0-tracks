# Release 0

def print_block
	puts "Hello I am a status message."
	yield("glue","breen")
	puts "Last status message"
end



print_block {|string1,string2| puts "We have two strings: #{string1}, and #{string2}"}


# Release 1

an_array = [1, 2, 3, 4, 5]
a_hash = {name: "Susan", age: 25, fave_color: "black"}


# Print original array
p an_array

# Print them using .each
an_array.each do |an_integer|
	puts an_integer
end

a_hash.each do | label, content |
	puts "#{label} is #{content}"
end


# Use .map! on the array
an_array.map! do | an_integer |
	puts an_integer
	an_integer.next
end

p an_array