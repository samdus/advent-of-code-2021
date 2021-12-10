class VentLine
  def initialize(x1,y1,x2,y2)
    @x=[x1,x2]
    @y=[y1,y2]
  end

  def get_points
    get_x_vector.zip(get_y_vector)
  end

  def get_max_x
    @x.max
  end

  def get_max_y
    @y.max
  end

  private

  def get_x_vector
    get_vector @x, @y
  end

  def get_y_vector
    get_vector @y, @x
  end

  def get_vector(a,b)
    if a[0] == a[1]
      [a[0]] * ((b.max - b.min) + 1)
    else
      (a.min..a.max)
    end
  end
end
