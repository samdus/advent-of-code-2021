class VentLine
  def initialize(x1, y1, x2, y2)
    @x1, @y1, @x2, @y2 = [x1, y1, x2, y2]
  end

  def get_points
    points = []
    c_x, c_y = [@x1, @y1]
    until [c_x, c_y] == [@x2, @y2] do
      points << [c_x, c_y]
      if c_x > @x2
        c_x -= 1
      elsif c_x < @x2
        c_x += 1
      end

      if c_y > @y2
        c_y -= 1
      elsif c_y < @y2
        c_y += 1
      end
    end
    points << [c_x, c_y]
  end

  def get_max_x
    [@x1, @x2].max
  end

  def get_max_y
    [@y1, @y2].max
  end
end