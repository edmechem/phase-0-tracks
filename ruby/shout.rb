# # Release 1: Write a Simple Module (Standalone)

# module Shout

# 	def self.yell_angrily(words)
# 		words + "!!!" + " :("
# 	end

# 	def self.yelling_happily(words)
# 		words + "!!!" + " Yay! :D"
# 	end

# end


# Release 3: Convert Standalone Module to a Mixin
# (take out .self from method definitions)
# (add puts to methods)

module Shout

	def yell_angrily(words)
		puts words + "!!!" + " :("
	end

	def yelling_happily(words)
		puts words + "!!!" + " Yay! :D"
	end
	
end


class Protester
	include Shout
end

class Pitcher
	include Shout
end


protester = Protester.new
protester.yell_angrily("Hey ho, hey ho, racism, sexism & inequality have got to go")

pitcher = Pitcher.new
pitcher.yelling_happily("Strikeout")
