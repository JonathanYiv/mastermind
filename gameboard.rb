require 'colorize'
# red, green, yellow, blue, black, magenta, cyan, white

class GameBoard
	attr_accessor :solution, :guesses, :hints

	def initialize
		@solution = ColorCode.new()
		@guesses = Array.new(12, ColorCode.new("white", "white", "white", "white"))
		@hints = Array.new(12, Hint.new("white", "white", "white", "white"))
	end

	def display
		puts "_____________________"
		@guesses.each_with_index { |guess, index| puts "| #{colorize(guess, true)} | #{colorize(@hints[index], false)} |" }
		puts "---------------------"
	end

	def refresh(row_index)
		evaluate(row_index)
		display
	end

	def evaluate(row_index)
		
		correct_colors = 0
		@guesses[row_index].colors.each_with_index { |color, index| correct_colors += 1 if @solution.colors[index] == color }
		misplaced_correct_colors = @guesses[row_index].colors.select { |color| @solution.colors.include?(color) == true }.uniq.length - correct_colors

		colors = []

		correct_colors.times do
			colors << "green"
		end

		misplaced_correct_colors.times do
			colors << "red" 
		end

		until colors.length == 4
			colors << "white"
		end

		@hints[row_index] = Hint.new(colors[0], colors[1], colors[2], colors[3])
	end

	def colorize(set, is_color_code)
		colors = []
		text = is_color_code ? "O" : "."
		set.colors.each { |color| case color
								  when "red" then colors.push(text.red)
								  when "green" then colors.push(text.green)
								  when "yellow" then colors.push(text.yellow)
								  when "blue" then colors.push(text.blue)
								  when "black" then colors.push(text.black)
								  when "magenta" then colors.push(text.magenta)
								  when "cyan" then colors.push(text.cyan)
								  when "white" then colors.push(text.white)
								  end
						}
		colors.join(" ")
	end
end
