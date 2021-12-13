require_relative 'submarine_controller'

class Jour2 < Dry::CLI::Command
  desc "Day 2: Dive!"

  argument :file, desc: "Le chemin du fichier d'entré."

  def call(file: nil, **)
    if file.nil?
      puts "Indiquez un fichier d'entré"
    else
      controller = SubmarineController.new

      File.open(file).readlines.map do |line|
        instruction, x = line.strip.split(' ')
        controller.follow_instruction(instruction, x.to_i)
      end

      puts "Depth: #{controller.depth}, Horizontal: #{controller.horizontal}, Mult: #{controller.depth * controller.horizontal}"
    end
  end
end
