# Mastermind Project

Check out my command line version of the game [Mastermind](https://en.wikipedia.org/wiki/Mastermind_(board_game)) built with Ruby!

This is a project from [The Odin Project](https://www.theodinproject.com/courses/ruby-programming/lessons/oop).

![Mastermind](/mastermind.png)

## Installation

Open your Terminal/Command Line. Navigate to the directory where your version will live. Type in the following:

$ git clone https://github.com/JonathanYiv/mastermind.git
$ cd mastermind
$ ruby mastermind.rb

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

Project is currently incomplete.
