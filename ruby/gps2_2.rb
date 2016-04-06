# GPS 2.2 - Ruby - Electronic Grocery List
# Ed Mechem & Danny Bravman (Regina Compton, guide)


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
   # initial_value = 1   # DRY!!!
   initial_list.each do | item |
       # list[item] = initial_value    # DRY!!!
       add_or_update_item(list, item)
   end
   list
end

# Method to add an item to a list
# input: list and (string containing (item name & optional quantity))
# steps: test for quantity, set to default if not
# output: list (with new item added)

# Method to update the quantity of an item
# input: list, item, new_quantity
# steps: do the same thing as add_or_update_item, but no default
# output: list (with new quantity)

# We decided to DRY!! and merge these two methods because they're effectively the same

def add_or_update_item(list, item, quantity = 1)
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
# p initial_list
list = create_list(initial_list)
# p list
list = add_or_update_item(list, 'lemonade', 2)
list = add_or_update_item(list, 'tomatoes', 3)
list = add_or_update_item(list, 'onions')
list = add_or_update_item(list, 'ice cream', 4)
list = remove_item(list, "lemonade")
list = add_or_update_item(list, "ice cream", 1)
pretty_print(list)


# Release 5: Reflect

# What did you learn about pseudocode from working on this challenge?

# We pasted in the pseudocode from the exercise which in hindsight might not have been the best approach - it might have been better to have the navigator reading the given pseudocode, discussing the problem solving approach with driver, and then coming up with our own pseudocode.  The biggest takeaway is just a reiteration of the importance of both pairs getting clear on methodology & approach, before psuedocoding (& thus of course, before coding).


# What are the tradeoffs of using arrays and hashes for this challenge?

# We were kind of overthinking it, and our guide recommended we simplify our approach. We had thought of maybe using an array of hashes, but the simpler approach we decided on was to have each 'item' on the grocery list just be the key, and have the quantity be the value. This approach simplified it immensely - we ended up with just one hash.

# An array could have been used, but it would have made it a more work to update or delete, since we'd have needed to find the item, and then go to the next element (the quantity) to change it; or when deleting, delete actualy two items (the item & its quantity). The hash was a better tool for this job, than an array would have been.


# What does a method return?

# A method returns whatever its last line evaluates to, unless specified otherwise.


# What kind of things can you pass into methods as arguments?

# Strings, integers, hashes, arrays.


# How can you pass information between methods?

# The way we did it is, we just called a method from within another method, passing it what we wanted it to operate on - and being sure to do the appropriate thing with the result, after we called it. One could also use global variables, but we haven't gone there yet and I'm sure there's considerations that come into play with that approach.


# What concepts were solidified in this challenge, and what concepts are still confusing?

# It was nice to learn about default values for arguments passed to methods. Everything was pretty familiar to us both actually, in terms of the actual aspects of ruby that we used to solve this challenge. We were a bit disoriented at the beginning, I think because of all the psuedocode we just copied in en masse. And we were kind of overthinking what the actual requirements were for this challenge. Our guide helped us scale back to really, only what was required. We build up simple driver code to test our methods as we built them, which helped as well - no actual user interaction, we just supplied test values in the driver code.
