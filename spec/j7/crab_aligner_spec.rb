require 'rspec'
require_relative '../../lib/j7/crab_aligner'

describe 'CrabAligner' do
  it 'succeeds const' do
    aligner = CrabAligner.new [16,1,2,0,4,2,7,1,2,14]
    expect(aligner.get_required_fuel).to eq 37
  end
  it 'succeeds non const' do
    aligner = CrabAligner.new [16,1,2,0,4,2,7,1,2,14]
    expect(aligner.get_required_fuel_non_const).to eq 168
    # expect(aligner.sum_diff_non_const 5).to eq 168
  end
end
