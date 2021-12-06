class SubmarineController
  attr_accessor :depth, :horizontal

  def initialize(depth=0, horizontal=0)
    @depth=depth
    @horizontal=horizontal
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
  end

  def go_down(x)
    @depth += x
  end

  def go_up(x)
    @depth -= x
  end
end
