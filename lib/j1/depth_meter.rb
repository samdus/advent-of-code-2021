class DepthMeter
  def initialize(report)
    @report = report
  end
  def get_report_descending
    depth_report(@report)
  end
  def get_report_descending_window
    depth_report(sum_slide_window(@report))
  end

  private

  def depth_report(report)
    first, second, *remaining = report
    return 0 if first.nil? || second.nil?
    (second > first ? 1 : 0) + depth_report(remaining.prepend(second))
  end

  def sum_slide_window(report, windowed_report=[])
    first, second, third, *remaining = report

    if first.nil? or second.nil? or third.nil?
      windowed_report
    else
      sum_slide_window(remaining.unshift(second, third), windowed_report.push(first + second + third))
    end
  end
end
