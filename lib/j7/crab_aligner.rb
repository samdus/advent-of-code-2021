class CrabAligner
  def initialize(crabs)
    @crabs = crabs.sort
  end

  def get_required_fuel
    len = @crabs.length
    center = len / 2
    len.even? ? [sum_diff(@crabs[center]), sum_diff(@crabs[center + 1])].min : sum_diff(@crabs[center])
  end

  def get_required_fuel_non_const
    center = @crabs[@crabs.length / 2]
    required_fuel_left = sum_diff_non_const(center)
    required_fuel_right = sum_diff_non_const(center + 1)

    if required_fuel_left > required_fuel_right
      it = center + 1
      more_right = sum_diff_non_const(it)
      until more_right > required_fuel_right or it > @crabs.length
        required_fuel_right = more_right
        more_right = sum_diff_non_const(it += 1)
      end

      required_fuel_right
    else
      it = center - 1
      more_left = sum_diff_non_const(it)
      until more_left > required_fuel_left or it < 0
        required_fuel_left = more_left
        more_left = sum_diff_non_const(it -= 1)
      end

      required_fuel_left
    end
  end

  def sum_diff_non_const(x)
    @crabs.sum { |crab| get_move_fuel((crab - x).abs) }
  end

  private

  def sum_diff(x)
    @crabs.sum { |crab| (crab - x).abs }
  end


  def get_move_fuel(x)
    (x * (x + 1)) / 2
  end
end
