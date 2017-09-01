class Game
  attr_accessor :board, :player_1, :player_2
  extend Players
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  def current_player
    self.board.turn_count.even? ? @player_1 : @player_2
  end
  def over?
    draw? || won?
  end
  def won?
    WIN_COMBINATIONS.find do |combo|
      board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[2]] != " "
    end
  end
  def draw?
    !won? && board.full?
  end
  def winner
    if won?
      board.cells[won?[0]]
    end
  end
  def turn
    board.display
    user_input = self.current_player.move(@board)
    self.board.valid_move?(user_input) ? self.board.update(user_input, self.current_player) : turn
  end
  def play
    banner
    turn until over?
    board.display
    puts winner ? "Congratulations #{winner}!".red : "Cat's Game!".red
  end
  def banner
    puts %q[
    ___________ .__        __
    \__    ___/ |__| _____/  |______    ____
       |    |   |  |/ ___\   __\__  \ _/ ___\
       |    |   |  \  \___|  |  / __ \  \___
       |____|   |__|\___  >__| (____  /\___  >
                        \/          \/     \/].blue
    puts "Lets play Tic Tac Toe!"
  end
end
