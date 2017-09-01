class Player
  attr_reader :token
  def initialize(token)
    @token = token
  end
  ##########
  # attr_reader :piece, :ui
  #
  #     def initialize(piece, ui)
  #       @piece, @ui = piece, ui
  #     end
  #
  #     def move(board)
  #       raise 'Not Implemented'
  #     end
  #
  #     def to_s
  #       piece
  #     end
  ##########
end
