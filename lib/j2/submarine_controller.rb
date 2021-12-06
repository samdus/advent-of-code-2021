class SubmarineController
  attr_accessor :depth, :horizontal

  def initialize(depth=0, horizontal=0, aim=0)
    @depth=depth
    @horizontal=horizontal
    @aim=aim
    @controls = {
      "forward" => method(:go_forward),
      "down" => method(:go_down),
      "up" => method(:go_up)
    }
  end

  def follow_instruction(instruction, x)
    unless @controls.key?(instruction)
      raise ArgumentError.new("Invalid instruction: '#{instruction}'!")
    end

    @controls[instruction].call(x)
  end

  private

  def go_forward(x)
    @horizontal += x
    @depth += @aim * x
  end

  def go_down(x)
    @aim += x
  end

  def go_up(x)
    @aim -= x
  end
end
