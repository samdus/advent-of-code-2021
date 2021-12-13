require_relative 'diagnosis_controller'

class Jour3 < Dry::CLI::Command
  desc "Day 3: Binary Diagnostic!"

  argument :file, desc: "Le chemin du fichier d'entré."

  def call(file: nil, **)
    if file.nil?
      puts "Indiquez un fichier d'entré"
    else

      controller = DiagnosisController.new(
        File.open(file).readlines.map { |line| line.strip.split('').map { |x| x.to_i } }
      )
      puts "Gamma: #{controller.gamma}, Epsilon: #{controller.epsilon}, Mult: #{controller.gamma * controller.epsilon}"
      puts "Oxygen: #{controller.oxygen_generator_rating}, CO2: #{controller.co2_scrubber_rating}, LSR: #{controller.life_support_rating}"
    end
  end
end
