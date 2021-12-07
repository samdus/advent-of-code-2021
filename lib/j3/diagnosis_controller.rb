require 'matrix'

class DiagnosisController
  attr_accessor :gamma, :epsilon, :oxygen_generator_rating, :co2_scrubber_rating, :life_support_rating

  def initialize(diagnosis_array)

    diagnosis = Matrix[*diagnosis_array]
    most_commons = calc_most_commons diagnosis

    @gamma = int_from_bit_array most_commons
    @epsilon = reverse_int_from_bit_array most_commons
    @oxygen_generator_rating = int_from_bit_array filter diagnosis, true
    @co2_scrubber_rating = int_from_bit_array filter diagnosis, false
    @life_support_rating = @oxygen_generator_rating * @co2_scrubber_rating
  end

  private

  def calc_most_commons(diagnosis)
    diagnosis.column_vectors.map { |column|
      frequent, _ = column.group_by { |i| i }.sort_by { |k, v| v.length }[-1]
      frequent
    }
  end

  def int_from_bit_array(x)
    x.join.to_i(2)
  end

  def reverse_int_from_bit_array(x)
    mask = 2 * (2 ** (x.length - 1)) - 1
    x.join.to_i(2) ^ mask
  end

  def get_common(diagnosis, column_idx, most)
    column = diagnosis.column(column_idx)
    sum_ge_half = column.sum >= column.size / 2.0
    if most
      sum_ge_half ? 1 : 0
    else
      sum_ge_half ? 0 : 1
    end
  end

  def filter(diagnosis, most, column = 0)
    case diagnosis.row_count
    when 0
      raise ArgumentError.new("Invalid matrix: \n#{diagnosis.inspect}")
    when 1
      diagnosis.row(0).to_a
    else
      common = get_common diagnosis, column, most
      filter Matrix[*diagnosis.row_vectors.select { |row|
        row[column] == common
      }], most, column + 1
    end
  end

end
