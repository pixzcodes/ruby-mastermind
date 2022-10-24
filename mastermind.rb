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
      end
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
end

class Player
  attr_reader :guess
  def get_guess
    @guess = gets.chomp.gsub(' ', '').split('')
  end
end

Game.new(Player, Computer).play
