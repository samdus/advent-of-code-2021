require 'rspec'
require_relative '../lib/j2/submarine_controller'

describe 'SubmarineController' do
  it 'succeeds' do
    controller = SubmarineController.new

    controller.follow_instruction('forward', 5)
    controller.follow_instruction('down', 5)
    controller.follow_instruction('forward', 8)
    controller.follow_instruction('up', 3)
    controller.follow_instruction('down', 8)
    controller.follow_instruction('forward', 2)

    expect(controller.depth).to eq 10
    expect(controller.horizontal).to eq 15
    expect(controller.depth * controller.horizontal).to eq 150
  end

  it 'invalid instruction' do
    controller = SubmarineController.new
    expect { controller.follow_instruction 'invalid', 1 }.to raise_error ArgumentError
  end
end
