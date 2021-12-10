require 'rspec'
require_relative '../../lib/j5/ventures_map_controller'

describe 'VenturesMapController' do
  it 'sans diag' do
    lines = [
      [0,9,5,9],
      [8,0,0,8],
      [9,4,3,4],
      [2,2,2,1],
      [7,0,7,4],
      [6,4,2,0],
      [0,9,2,9],
      [3,4,1,4],
      [0,0,8,8],
      [5,5,8,2]
    ].select { |line| line[0] == line[2] || line[1] == line[3] }

    controller = VenturesMapController.new lines
    controller.draw_lines

    expect(controller.count_overlaps).to eq 5
  end

  it 'avec diag' do
    lines = [
      [0,9,5,9],
      [8,0,0,8],
      [9,4,3,4],
      [2,2,2,1],
      [7,0,7,4],
      [6,4,2,0],
      [0,9,2,9],
      [3,4,1,4],
      [0,0,8,8],
      [5,5,8,2]
    ]

    controller = VenturesMapController.new lines
    controller.draw_lines

    expect(controller.count_overlaps).to eq 12
  end
end
