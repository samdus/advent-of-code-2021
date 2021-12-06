require_relative 'diagnostic_controller'

class Jour3 < Dry::CLI::Command
  desc "Day 3: Binary Diagnostic!"

  argument :file, desc: "Le chemin du fichier d'entré."

  def call(file: nil, **)
    if file.nil?
      puts "Indiquez un fichier d'entré"
    else

      controller = DiagnosticController.new(
        File.open(file).readlines.map{ |line| line.strip.split('') }
      )
      puts "Gamma: #{controller.gamma}, Epsilon: #{controller.epsilon}, Mult: #{controller.gamma * controller.epsilon}"
    end
  end
end
