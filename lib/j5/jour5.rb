require "dry/cli"
require_relative 'ventures_map_controller'

class Jour5 < Dry::CLI::Command
  desc "Day 5: Hydrothermal Venture"

  argument :file, desc: "Le chemin du fichier d'entré."
  argument :diag, desc: "Est-ce qu'on doit accepter les diagonales? Faux, par défaut."

  def call(file: nil, diag: false, **)
    if file.nil?
      puts "Indiquez un fichier d'entré"
    else
      lines = File.open(file)
                  .readlines
                  .map { |line| line.gsub(" -> ", ",").strip.split(",")
                                    .map { |s| s.to_i } }
      unless diag
        lines = lines.select { |line| line[0] == line[2] || line[1] == line[3] }
      end

      controller = VenturesMapController.new lines
      controller.draw_lines

      puts "Overlaps: #{controller.count_overlaps}"
    end
  end
end
