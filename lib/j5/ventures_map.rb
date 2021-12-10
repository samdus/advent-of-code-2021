require 'matrix'

class VenturesMap
  def initialize(row_count, column_count)
    @matrix = Matrix.zero(row_count, column_count)
  end

  def increment(point)
    @matrix[point[1], point[0]] += 1
  end

  def count_overlaps
    @matrix.row_vectors.inject(0) do |sum, row|
      sum + row.inject(0) do |row_sum, value|
        row_sum + (value > 1 ? 1 : 0)
      end
    end
  end
end
