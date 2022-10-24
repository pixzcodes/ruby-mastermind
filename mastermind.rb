class Game
  def initialize (code_breaker, code_maker )
    @code_breaker = code_breaker.new
    @code_maker = code_maker.new
    @code_maker.create_code
  end
  def play
    
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

end

Game.new(Player, Computer).play
