class Game
  def initialize (code_breaker, code_maker )
    @code_breaker = code_breaker.new
    @code_maker = code_maker.new
    @code_maker.create_code
  end

  def play
    @turns = 1
    puts "Welcome to Master Mind!"
    puts "You are the Code Breaker."
    puts "The computer will generate a new code that will be"
    puts "a mix of the four colors: "
    puts "Yellow (y), Red (r), Blue (b), Purple (p)."
    puts "Type the lowercase first letter of each color "
    puts "in the sequence that you think the code is in."
    puts "You have 12 turns to guess the correct code."
    puts "Good Luck!"
    while @turns <= 12
      puts "Turn ##{@turns}"
      puts "Code Breaker guess:"
      loop do # get guess and run checks to make sure its valid
        @code_breaker.get_guess
        if @code_breaker.guess.length == 4
          if @code_breaker.guess.all? {|letter| ['r', 'p', 'b', 'y'].any? {|x| x == letter}}
            break 
          end
        end
        puts "Please enter a valid guess"
      end # end of guess block

      if @code_breaker.guess === @code_maker.code 
        puts "You guessed correctly! You win!"
        puts "Guesses taken: #{@turns}"
        break
      end
      @code_maker.guess_response(@code_breaker.guess)
      @turns += 1
    end
    if @turns >=13
      puts "Oh no! It seems as though you have run out of turns"
      puts "The code was #{@code_maker.code.join(' ')}"
    end
  end
end

class Computer
  attr_reader :code
  def create_code
    @code = []
    @colors = ['r', 'p', 'b', 'y']
    4.times {@code.push(@colors.sample)}
    @code
  end

  def guess_response (guess)
    guess.each_with_index do | guess_element, guess_index |
      @code.each_with_index do | code_element, code_index |
        if guess_element === code_element 
          if guess_index === code_index
            puts "Color at position #{guess_index + 1} is correct"
          end
        end
      end
    end
  end
end

class Player
  attr_reader :guess
  def get_guess
    @guess = gets.chomp.gsub(' ', '').split('')
  end
end

Game.new(Player, Computer).play
