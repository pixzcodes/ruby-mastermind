class Game
  def initialize (code_breaker, code_maker )
    @code_breaker = code_breaker.new
    @code_maker = code_maker.new
    @code_maker.create_code
  end

  def play
    @turns = 0
    while @turns < 12
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
        puts "Guesses taken: #{@turns + 1}"
        break
      end
      @code_maker.guess_response(@code_breaker.guess)
      @turns += 1
    end
  end
end

class Computer
  attr_reader :code
  def create_code
    @code = []
    @possible_colors = ['r', 'p', 'b', 'y']
    4.times {@code.push(@possible_colors.sample)}
    @code
  end

  def guess_response (guess)
    @guess = guess
    @guess.each_with_index do | guess_element, guess_index |
      @code.each_with_index do | code_element, code_index |
        # compare guess with code and give different answers 
        #depending on if the color and index matches or not
        # give default answer if it does not match anything
        # correct color but wrong space?
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
