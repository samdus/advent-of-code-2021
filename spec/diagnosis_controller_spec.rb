require 'rspec'
require_relative '../lib/j3/diagnosis_controller'

describe 'DiagnosisController' do
  it 'succeeds' do
    controller = DiagnosisController.new([
                                            [0, 0, 1, 0, 0],
                                            [1, 1, 1, 1, 0],
                                            [1, 0, 1, 1, 0],
                                            [1, 0, 1, 1, 1],
                                            [1, 0, 1, 0, 1],
                                            [0, 1, 1, 1, 1],
                                            [0, 0, 1, 1, 1],
                                            [1, 1, 1, 0, 0],
                                            [1, 0, 0, 0, 0],
                                            [1, 1, 0, 0, 1],
                                            [0, 0, 0, 1, 0],
                                            [0, 1, 0, 1, 0]])
    expect(controller.gamma).to eq 22
    expect(controller.epsilon).to eq 9
    expect(controller.oxygen_generator_rating).to eq 23
    expect(controller.co2_scrubber_rating).to eq 10
    expect(controller.life_support_rating).to eq 230
  end
end
