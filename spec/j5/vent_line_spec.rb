require 'rspec'
require_relative '../../lib/j5/vent_line'

describe 'VentLine' do
    it 'succeeds' do
      line1 = VentLine.new 1,1,1,3
      line2 = VentLine.new 9,7,7,7
      line3 = VentLine.new 6,4,2,0
      line4 = VentLine.new 1,1,3,3
      line5 = VentLine.new 9,7,7,9

      expect(line1.get_points).to match_array([[1, 1], [1, 2], [1, 3]])
      expect(line2.get_points).to match_array([[9, 7], [8, 7], [7, 7]])
      expect(line3.get_points).to match_array([[6,4],[5,3],[4,2],[3,1],[2,0]])
      expect(line4.get_points).to match_array([[1,1],[2,2],[3,3]])
      expect(line5.get_points).to match_array([[9,7],[8,8],[7,9]])
    end
end
