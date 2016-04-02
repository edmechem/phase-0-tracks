garden = {
	rose_bush: {
		pretty_name: 'Rose Bush',
		elements: [
			'Roses',
			'Thorns',
			'Leaves'
		]
	},
	lemon_tree: {
		pretty_name: 'Lemon Tree',
		elements: [
			'Lemons',
			'Leaves'
		]
	},
	oxalis: {
		pretty_name: 'Sourgrass',
		elements: [
			'Stalks',
			'Flowers'
		]
	},
	ivy: {
		# pretty_name: 'Ivy',  # Actually, no - ivy is not pretty. No pretty name for you!
		elements: [
			'Leaves',
			'Vines'
		]
	}
}

# Initial summary description of garden
puts "There are #{garden.length} items in the garden:"
garden.select{ |item, attributes| puts "    #{item}" }

# Build an array of names of items in garden
items = []
garden.each_key { |item| items.push(item) }
# p items

# Using elements of this array (as symbols), walk thru the garden hash, 
# building a list of pretty names
pretty_names = []
index = 0
while index < items.length
	if garden[items[index].to_sym].has_key?(:pretty_name)
		pretty_names.push( garden[items[index].to_sym][:pretty_name] )
	end
	index += 1
end
# p pretty_names

# And now list these pretty names
puts "\nThere are #{pretty_names.length} items in the garden that have pretty names:"
pretty_names.each{ | pretty_name | puts "    #{pretty_name}" }


# Mention what actual items we might be interested in
puts "\nWe're mainly interested in:"
puts "    #{garden[:rose_bush][:elements][0]} from the #{garden[:rose_bush][:pretty_name]}"
puts "    #{garden[:lemon_tree][:elements][0]} from the #{garden[:lemon_tree][:pretty_name]}"
puts "    #{garden[:oxalis][:elements][0]} from the #{garden[:oxalis][:pretty_name]}"

puts ""
