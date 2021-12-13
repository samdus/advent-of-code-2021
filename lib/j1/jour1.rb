require_relative 'depth_meter'
require_relative '../util/file_util'

class Jour1 < Dry::CLI::Command
  desc "Day 1: Sonar Sweep"

  argument :file, desc: "Le chemin du fichier d'entré."
  argument :windowed, desc: "Utilise une somme de fenêtre de 3"

  def call(file: nil, windowed: false, **)
    if file.nil?
      puts "Indiquez un fichier d'entré"
    else
      input_list = FileUtil.file_to_int_array(file)
      meter = DepthMeter.new(input_list)

      if windowed
        puts meter.get_report_descending_window
      else
        puts meter.get_report_descending
      end
    end
  end

end
