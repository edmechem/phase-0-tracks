module Shout

	def self.yell_angrily(words)
		words + "!!!" + " :("
	end

	def self.yelling_happily(words)
		words + "!!!" + " Yay! :D"
	end

end


puts Shout.yell_angrily("Dammit")
puts Shout.yelling_happily("Wow")
