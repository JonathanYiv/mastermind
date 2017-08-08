require 'colorize'

class Computer
	attr_accessor :color_spectrum, :guess_set, :correct_colors

	def initialize
		@color_spectrum = ["red", "green", "yellow", "blue", "black", "magenta", "cyan", "white"]
		@guess_set = 0
		@correct_colors = []
	end

	def guess(hints, turn) 
		computer_guess = get_guess(hints, turn)
		print "#{computer_guess[0]}, #{computer_guess[1]}, #{computer_guess[2]}, #{computer_guess[3]}\n"
		computer_guess
	end

	def get_guess(hints, turn) 
		computer_guess = []

=begin VERSION 1
		if turn < 9
			4.times do
				computer_guess << @color_spectrum[@guess_set] 
			end
		
			if turn > 1
				@correct_colors << @color_spectrum[@guess_set - 1] if hints[12 - turn + 1].colors[0] == "green"
			end

			@guess_set += 1 if @guess_set < 8
		else
			if turn == 9
				@correct_colors << @color_spectrum[@guess_set - 1] if hints[12 - turn + 1].colors[0] == "green"
			end
			computer_guess = @correct_colors
			@correct_colors = @correct_colors.shuffle
		end
=end

		#VERSION 2
		case turn
		when 1
			4.times { computer_guess << @color_spectrum[@guess_set] }

			@guess_set += 1
		when (2..8)
			4.times { computer_guess << @color_spectrum[@guess_set] }

			@correct_colors << @color_spectrum[@guess_set - 1] if color_is_correct(hints, turn)

			@guess_set += 1 if @guess_set < 8
		when 9
			@correct_colors << @color_spectrum[@guess_set - 1] if color_is_correct(hints, turn)
			computer_guess = @correct_colors
			@correct_colors = @correct_colors.shuffle
		else
			computer_guess = @correct_colors
			@correct_colors = @correct_colors.shuffle
		end
		
		computer_guess
	end

	def color_is_correct(hints, turn)
		hints[12 - turn + 1].colors[0] == "green"
	end
end