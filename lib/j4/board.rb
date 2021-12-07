class Board
  attr_accessor :already_won

  def initialize(board_array)
    board_matrix = Matrix[*board_array]
    @rows = board_matrix.row_vectors
    @columns = board_matrix.column_vectors
  end

  def draw(x)
    @rows = remove(@rows, x)
    @columns = remove(@columns, x)
  end

  def won?
    has_empty?(@rows) || has_empty?(@columns)
  end

  def sum
    @rows.reduce(0) { |s, row| s + row.sum }
  end

  private

  def remove(vectors, x)
    vectors.map { |row| row.filter { |val| val != x } }
  end

  def has_empty?(vectors)
    vectors.any? {|row| row.size == 0}
  end
end
