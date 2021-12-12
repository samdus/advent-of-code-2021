require 'rspec'
require_relative '../../lib/j6/lanternfish_estimator'

describe 'LanternfishEstimator' do
  it 'succeeds' do
    estimator = LanternfishEstimator.new [3,4,3,1,2]
    (0...18).each do |day|
      estimator.another_day

      puts "After #{day+1} days, there's #{estimator.fish_count} fish."
    end

    (18...80).each do |day|
      estimator.another_day

      puts "After #{day+1} days, there's #{estimator.fish_count} fish."
    end

    expect(estimator.fish_count).to eq 5934

    (80...256).each do |day|
      estimator.another_day

      puts "After #{day+1} days, there's #{estimator.fish_count} fish."
    end

    expect(estimator.fish_count).to eq 26984457539
  end
end
