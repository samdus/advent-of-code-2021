require_relative 'ventures_map'
require_relative 'vent_line'

class VenturesMapController
  def initialize(lines)
    @lines = lines.map { |line| VentLine.new(*line) }
    @map = VenturesMap.new get_max_y + 1, get_max_x + 1
  end

  def draw_lines
    @lines
      .flat_map(&:get_points)
      .each { |line| @map.increment(line) }
  end

  def count_overlaps
    @map.count_overlaps
  end

  private

  def get_max_x
    @lines.map(&:get_max_x).max
  end

  def get_max_y
    @lines.map(&:get_max_y).max
  end

end
