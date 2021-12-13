require "dry/cli"
require_relative 'crab_aligner'

class Jour7 < Dry::CLI::Command
  desc "Day 7: The Treachery of Whales"

  argument :file, desc: "Le chemin du fichier d'entré."
  argument :const, desc: "La quantité de carburant est constante."

  def call(file: nil, const: "true", **)
    if file.nil?
      puts "Indiquez un fichier d'entré"
    else
      crabs = File.open(file).readlines.flat_map {|line| line.strip.split(",").map { |fish_counter| fish_counter.to_i }}
      aligner = CrabAligner.new crabs

      if const.to_s.downcase == "true"
        puts "We need #{aligner.get_required_fuel} fuel."
      else
        puts "We need #{aligner.get_required_fuel_non_const} fuel (non const)."
      end
    end
  end
end
