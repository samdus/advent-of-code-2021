require 'rspec'
require_relative '../lib/j3/diagnostic_controller'

describe 'DiagnosticController' do
  it 'succeeds' do
    controller = DiagnosticController.new([
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
  end
end
