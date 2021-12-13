require_relative 'board'

class BingoController
  NO_WINNER=-1

  def initialize(numbers, board_arrays)
    @numbers = numbers
    @boards = board_arrays.map { |board_array| Board.new board_array }
  end

  def play
    @numbers.each do |number|
      @boards.each do |board|
        board.draw number
        if board.won?
          return board.sum * number
        end
      end
    end

    NO_WINNER
  end

  def cheat
    win_sum = NO_WINNER

    @numbers.each do |number|
      @boards.delete_if do |board|
        board.draw number
        if board.won?
          win_sum = board.sum * number
          true
        end
      end
    end

    win_sum
  end
end
