# Replace in the "<???>" with the appropriate method (and arguments, if any).
# Uncomment the calls to catch these methods red-handed.

# When there's more than one suspect who could have
# committed the crime, add additional calls to prove it.


# First, though - we have to clean up after the wily rascal
# who used “curly quotes”, & change them to "regular quotes"!

puts "iNvEsTiGaTiOn".swapcase
# => "InVeStIgAtIoN"

puts "zom".gsub(/o/, 'oo')
# => "zoom"

puts "enhance".center(15)
# => "    enhance    "

puts "Stop! You’re under arrest!".upcase
# => "STOP! YOU’RE UNDER ARREST!"
# This is one of the culprits - ALL UPPER CASE!

puts "the usual".concat(" suspects")
#=> "the usual suspects"

puts " suspects".prepend("the usual")
# => "the usual suspects"

puts "The case of the disappearing last letter".chop
# => "The case of the disappearing last lette"
# This is the other culprit - chopping off the last letter!

puts "The mystery of the missing first letter".reverse.chop.reverse
# => "he mystery of the missing first letter"

puts "Elementary  ,    my   dear      Watson!".squeeze(" ").gsub(' ,', ',')
# => "Elementary, my dear Watson!"

puts "z".ord
# => 122 
# (What is the significance of the number 122 in relation to the character z?)
# It's the "ordinal" of this one character string;
# in other words, the ASCII code for it.

puts "How many times does the letter ‘a’ appear in this string?".count "a"
# => 4