# Mastermind Project

Check out my command line version of the game [Mastermind](https://en.wikipedia.org/wiki/Mastermind_(board_game)) built with Ruby!

This is a project from [The Odin Project](https://www.theodinproject.com/courses/ruby-programming/lessons/oop).

![Mastermind](/mastermind.png)

## Installation

Open your Terminal/Command Line. Navigate to the directory where your version will live. Type in the following:

```
$ git clone https://github.com/JonathanYiv/mastermind.git
$ cd mastermind
$ ruby mastermind.rb
```

## Pre-Project Thoughts

I will need to figure out how to colorize the command line from a ruby script.

### Thoughts on Structure

```ruby
class Mastermind
	instance variables:
		gameboard
	methods:
		initialize: takes a parameter to decide whether human/computer picks the code
		play: starts the game
			instructions: prints the instructions

class GameBoard = one instance
	instance variables: 
		solution as a colorcode object
		array of colorcode objects for display
		array of hint objects for display
	methods:
		display: displays the entire board
		refresh: given a new colorcode, adds it to the display, and evaluates the hints
		evalute: based on the colorcode, provide a hint

class ColorCode = instances include a solution instance and a guess instance 
	instance variables: 
		color1
		color2
		color3
		color4
	methods:
		initialize: takes four parameters to create a set of colors or defaults to a randomly selected set of color

class Hint = instances of the hints with red/white/black
	instance variables:
		color1
		color2
		color3
		color4
	methods:
		initialize: takes five parameters (including the colorcode solution) and sets its four colors accordingly

class Computer
	instance variables:
		included colors
	methods:
		algorithms to solve mastermind
```
	


## Post-Project Thoughts

1. To include color in the project, I found the ruby gem "colorize." I also read about ANSI Escape Codes [(see below)](https://en.wikipedia.org/wiki/ANSI_escape_code#Colors) which were a little too intense for the scope of this project. See below.

```ruby
class String
	def black;          "\e[30m#{self}\e[0m" end
	def red;            "\e[31m#{self}\e[0m" end
	def green;          "\e[32m#{self}\e[0m" end
	def brown;          "\e[33m#{self}\e[0m" end
	def blue;           "\e[34m#{self}\e[0m" end
	def magenta;        "\e[35m#{self}\e[0m" end
	def cyan;           "\e[36m#{self}\e[0m" end
	def gray;           "\e[37m#{self}\e[0m" end

	def bg_black;       "\e[40m#{self}\e[0m" end
	def bg_red;         "\e[41m#{self}\e[0m" end
	def bg_green;       "\e[42m#{self}\e[0m" end
	def bg_brown;       "\e[43m#{self}\e[0m" end
	def bg_blue;        "\e[44m#{self}\e[0m" end
	def bg_magenta;     "\e[45m#{self}\e[0m" end
	def bg_cyan;        "\e[46m#{self}\e[0m" end
	def bg_gray;        "\e[47m#{self}\e[0m" end
end
```

2. The computer AI was rather complex to implement; I spent the most time on that portion specifically. I only managed to get it to a 20% win-rate for now. I may come back later and update it when I am more knowledgeable.

3. My last project, [Tic-Tac-Toe](https://github.com/JonathanYiv/tic-tac-toe) followed poor practices regarding separating classes into different files. This project does better in that regard. However, several methods are overly complex and have too much responsibility. There are also several incredibly long lines that are difficult to read that I am not proud of. I plan to come back and refactor the project when I am more knowledgeable.

4. Overall, it was a very fun project, probably the most complex for me to date.