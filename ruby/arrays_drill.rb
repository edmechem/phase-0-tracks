drill = []
p drill
drill << 1 << 2 << 3 << 4 << 5
p drill
drill.delete_at(2)
p drill
drill.insert(2, "three")
p drill
drill.shift
p drill

if drill.index(6) == nil
	our_index = "(nil)"
else
	our_index = drill.index(6)
end

p "The index of FixNum 6 is: #{our_index}"

drill_two = [6, 7, 8]

combined_array = drill + drill_two
p combined_array