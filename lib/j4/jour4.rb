require_relative 'bingo_controller'

class Jour4 < Dry::CLI::Command
  desc "Day 4: Giant Squid"

  argument :file, desc: "Le chemin du fichier d'entré."
  argument :cheat, desc: "Doit-on tricher ? (true,false)"

  def call(file: nil, cheat: false, **)
    if file.nil?
      puts "Indiquez un fichier d'entré"
    else
      lines = File.open(file).readlines
      numbers = lines.shift.strip.split(',').map { |e| e.to_i }
      lines.shift

      boards = []
      curr = []

      lines.each do |line|
        if line == "\n"
          boards.push(curr)
          curr = []
        else
          curr.push line.strip.split(' ').map { |e| e.to_i }
        end
      end

      controller = BingoController.new numbers, boards
      if cheat
        puts "Winner: #{controller.cheat}"
      else
        puts "Winner: #{controller.play}"
      end
    end
  end
end
