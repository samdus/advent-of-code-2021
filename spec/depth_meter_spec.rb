require_relative '../lib/j1/depth_meter'

RSpec.describe DepthMeter do
  describe "get_report_descending" do

    it "get depth with empty array" do
      meter = DepthMeter.new([])
      expect(meter.get_report_descending).to eq 0
    end

    it "get depth with one element array" do
      meter = DepthMeter.new([1])
      expect(meter.get_report_descending).to eq 0
    end

    it "get depth with two element - descend" do
      meter = DepthMeter.new([1, 2])
      expect(meter.get_report_descending).to eq 1
    end

    it "get depth with two element - same" do
      meter = DepthMeter.new([1,1])
      expect(meter.get_report_descending).to eq 0
    end

    it "get depth with two element - ascend" do
      meter = DepthMeter.new([2,1])
      expect(meter.get_report_descending).to eq 0
    end

    it "get depth with multiple elements" do
      meter = DepthMeter.new([199, 200, 208, 210, 200, 207, 240, 269, 260, 263])
      expect(meter.get_report_descending).to eq 7
    end

    it "get windowed depth with multiple elements" do
      meter = DepthMeter.new([607, 618, 618, 617, 647, 716, 769, 792])
      expect(meter.get_report_descending_window).to eq 5
    end
  end
end