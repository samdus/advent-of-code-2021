require 'rspec'
require_relative '../../lib/j5/ventures_map'

describe 'VenturesMap' do
    it 'succeeds' do
      map = VenturesMap.new 5,5

      map.increment [1,1]
      map.increment [1,2]
      map.increment [1,3]

      map.increment [2,2]
      map.increment [2,3]
      map.increment [2,4]

      map.increment [1,2]
      map.increment [2,2]

      expect(map.count_overlaps).to eq 2
    end
end
