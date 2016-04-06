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

def add_item(list, item, quantity = 1)
   list[item] = quantity
   list
end

# Method to remove an item from the list
# input: list, item
# steps: remove key from hash
# output: list (without item)

def remove_item(list, item)
    list.delete(item)
    list
end


# Method to update the quantity of an item
# input: list, item, new_quantity
# steps: do the same thing as add_item, but no default
# output: list (with new quantity)

def update_quantity(list, item, new_quantity)
   list[item] = new_quantity
   list
end

# Method to print a list and make it look pretty
# input: list
# steps:
   # use an "each" to go thru the elements, puts them (w interpolation)
# output: nil
def pretty_print(list)
    list.each {|item, quantity| puts "#{item} : #{quantity}"}
end

# initial list
initial_list = "carrots apples cereal pizza"
list = create_list(initial_list)
list = add_item(list, 'lemonade', 2)
list = add_item(list, 'tomatoes', 3)
list = add_item(list, 'onions')
list = add_item(list, 'ice cream', 4)
list = remove_item(list, "lemonade")
list = update_quantity(list, "ice cream", 1)
pretty_print(list)
