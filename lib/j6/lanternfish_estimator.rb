class LanternfishEstimator
  attr_accessor :current_day, :fish_count

  def initialize(initial_fish)
    @current_day = 0
    @fish_count = initial_fish.length
    @fish_reproduction = [0] * 9

    initial_fish.each do |day|
      @fish_reproduction[day] += 1
    end
  end

  def another_day
    @fish_count += @fish_reproduction[@current_day]

    @fish_reproduction.push(0)

    @fish_reproduction[@current_day + 7] += @fish_reproduction[@current_day]
    @fish_reproduction[@current_day + 9] += @fish_reproduction[@current_day]

    @current_day += 1
  end
end
