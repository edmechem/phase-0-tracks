# List will look like this:
# item = {:apple => 5, :orange => 3, :bread => 2}
# puts item

# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps: 
  # chop it up by spaces
  # set default quantity  (1)
  # print the list to the console [can you use one of your other methods here?]
# output: [what data type goes here, array or hash?]

def create_list(string)
	list = {}
	initial_list = string.split(' ')
	initial_value = 1
	initial_list.each do | item |
		list[item] = initial_value
	end
	list
end


# Method to add an item to a list
# input: list and (string containing (item name & optional quantity))
# steps: test for quantity, set to default if not
# output: list (with new item added)

def add_item(list, item, quantity)
	list[item] = quantity
	list
end



# Method to remove an item from the list
# input:
# steps:
# output:


# Method to update the quantity of an item
# input:
# steps:
# output:

# Method to print a list and make it look pretty
# input: Array
# steps:
	# use an "each" to go thru the elements, puts them (w interpolation)
# output: nil


# initial list
initial_list = "carrots apples cereal pizza"

list = create_list(initial_list)

list = add_item(list, 'potato', 7)
p list