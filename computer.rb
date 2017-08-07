require 'colorize'

class Computer
	attr_accessor :color_spectrum, :selected_colors

	def initialize
		@color_spectrum = ["red", "green", "yellow", "blue", "black", "magenta", "cyan", "white"]
		@selected_colors = []
	end

	def guess
		computer_guess = get_guess #should return an array of strings that are part of the color spectrum
		print "#{computer_guess[0]}, #{computer_guess[1]}, #{computer_guess[2]}, #{computer_guess[3]}\n"
		computer_guess
	end

	def get_guess
		computer_guess = []
		4.times do |variable|
			computer_guess << random
		end
		@selected_colors.clear
		computer_guess
	end

	def random
		random = @color_spectrum.sample
		until !@selected_colors.include?(random)
			random = @color_spectrum.sample
		end
		@selected_colors << random
		random
	end
end