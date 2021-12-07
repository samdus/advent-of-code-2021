require 'rspec'
require_relative '../../lib/j4/board'

describe 'Board' do
  it 'succeeds' do
    board = Board.new [
                        [14, 21, 17, 24,  4],
                        [10, 16, 15,  9, 19],
                        [18,  8, 23, 26, 20],
                        [22, 11, 13,  6,  5],
                        [2,   0, 12,  3,  7],
                      ]
    numbers = [7, 4, 9, 5, 11, 17, 23, 2, 0, 14, 21, 24]

    numbers.each { |number| board.draw(number) }
    expect(board.won?).to be_truthy
    expect(board.sum).to eq 188
  end
end
