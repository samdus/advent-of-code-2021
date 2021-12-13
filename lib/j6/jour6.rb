require "dry/cli"
require_relative 'lanternfish_estimator'

class Jour6 < Dry::CLI::Command
  desc "Day 6: Lanternfish"

  argument :file, desc: "Le chemin du fichier d'entré."
  argument :nb_days, desc: "Nombre de jour."

  def call(file: nil, nb_days: 80, **)
    if file.nil?
      puts "Indiquez un fichier d'entré"
    else
      initial_fish = File.open(file).readlines.flat_map {|line| line.strip.split(",").map { |fish_counter| fish_counter.to_i }}
      estimator = LanternfishEstimator.new initial_fish
      (0...nb_days.to_i).each do |day|
        estimator.another_day

        puts "After #{day+1} days, there's #{estimator.fish_count} fish."
      end
    end
  end
end
