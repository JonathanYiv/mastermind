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

=begin	
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
=end
		
		#VERSION 3: AI now will start guessing combinations of the correct colors as soon as it has all four. Roughly 20% win rate
		if @correct_colors.uniq.length != 4
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