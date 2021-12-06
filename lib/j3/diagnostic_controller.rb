require 'matrix'

class DiagnosticController
  attr_accessor :gamma, :epsilon

  def initialize(diagnostic_array)
    diagnostic = Matrix[*diagnostic_array]
    most_commons = calc_most_commons diagnostic

    @gamma = int_from_bit_array most_commons
    @epsilon = reverse_int_from_bit_array most_commons
  end

  private

  def calc_most_commons(diagnostic)
    diagnostic.column_vectors.map { | column |
      frequent, _ = column.group_by { |i| i }.sort_by { |k,v| v.length }[-1]
      frequent
    }
  end

  def int_from_bit_array(x)
    x.join.to_i(2)
  end

  def reverse_int_from_bit_array(x)
    mask = 2*(2**(x.length-1))-1
    x.join.to_i(2) ^ mask
  end

end
