class Board
  attr_accessor :cells
  def initialize
    @cells = [" "," "," "," "," "," "," "," "," "]
  end
  def reset!
    @cells = Array.new(9, " ")
  end
  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end
  def position(input)
    self.cells[input_to_index(input)]
  end
  def input_to_index(input)
    input.to_i - 1
  end
  def full?
    self.cells.all?{|cell| cell == "X" || cell == "O"}
  end
  def turn_count
    self.cells.count{|cell| cell == "X" || cell == "O"}
  end
  def taken?(input)
    # !(self.cells[input_to_index(input)] == " " || self.cells[input_to_index(input)].nil?)
    self.position(input) == "X" || self.position(input) == "O"
  end
  def valid_move?(input)
    user_input = input_to_index(input)
    user_input.between?(0,8) && !taken?(input)
  end
  def update(input, player)
      self.cells[input_to_index(input)] = player.token
  end
end
