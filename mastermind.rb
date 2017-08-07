require_relative 'gameboard.rb'
require_relative 'colorcode.rb'
require_relative 'hint.rb'
require_relative 'computer.rb'
require 'colorize'

class Mastermind
	attr_accessor :gameboard, :win, :turns, :color_spectrum

	def initialize
		@gameboard = GameBoard.new()
		@win = false
		@turns = 1
		@color_spectrum = ["red", "green", "yellow", "blue", "black", "magenta", "cyan", "white"]
	end

	def play
		instructions
		#prompt_switch_mode
		start
	end

	def instructions
		puts "  __  __            _                     _           _ 
 |  \\/  | __ _  ___| |_  ___  _ _  _ __  (_) _ _   __| |
 | |\\/| |/ _` |(_-<|  _|/ -_)| '_|| '  \\ | || ' \\ / _` |
 |_|  |_|\\__,_|/__/ \\__|\\___||_|  |_|_|_||_||_||_|\\__,_|"
		puts "_________________________________________________________\n\n"
		puts "Guess the code to win!"
		puts "The computer will select a code of four different colors in a specific order!"
		puts "You have twelve guesses."
		@gameboard.display
		puts "_________________________________________________________\n\n"
		puts "The left side is where your guesses will go."
		puts "The right side will tell you how accurate you are: "
		puts "green for every color in the correct position"
		puts "red for every color in an incorrect position!" 
		puts "\nGood luck!"
		puts "_________________________________________________________\n\n"
	end

	#def prompt_switch_mode
		#puts "Do you want to play or do you want the computer to play?"
	#end

	def start
		make_guesses
		turns > 12 ? lose : win
	end

	def make_guesses
		while @win == false && @turns < 13
			prompt_guess
			guess = get_guess
			add_guess(guess)
			@win = true if gameboard.guesses[12 - @turns].colors == gameboard.solution.colors
			@turns += 1 if @win == false
		end
	end

	def prompt_guess
		puts "What is your ##{@turns} guess?"
		puts "Type four colors separated by spaces."
		print "Your choices are: red, green, yellow, blue, black, magenta, cyan, and white.\n> "
	end

	def get_guess
		guess = gets.chomp.downcase.split(" ")

		until guess.length == 4
			print "\nYou entered the wrong amount of colors! Try again:\n> "
			guess = gets.chomp.split(" ")
		end

		until @color_spectrum.include?(guess[0]) && @color_spectrum.include?(guess[1]) && @color_spectrum.include?(guess[2]) && @color_spectrum.include?(guess[3])
			print "\nYou can only enter the colors specified! Try again:\n> "
			guess = gets.chomp.split(" ")
		end

		guess
	end

	def add_guess(guess)
		gameboard.guesses[12 - @turns] = ColorCode.new(guess[0], guess[1], guess[2], guess[3])
		gameboard.refresh(12 - @turns)
	end

	def lose
		puts "You have failed to crack the puzzle! It's okay; you're just not smart."
		puts "The solution was #{@gameboard.solution.colors}"
	end

	def win
		puts "You have solved the code! Amazing!"
	end
end

game = Mastermind.new()
game.play