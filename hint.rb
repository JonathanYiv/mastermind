require 'colorize'
# red, green, yellow, blue, black, magenta, cyan, white

class Hint
	attr_accessor :colors

	def initialize(color1, color2, color3, color4)
		@colors = [color1, color2, color3, color4]
	end
end
