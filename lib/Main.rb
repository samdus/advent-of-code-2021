#!/usr/bin/env ruby
require "bundler/setup"
require "dry/cli"
require_relative "j1/jour1"
require_relative 'j2/jour2'
require_relative 'j3/jour3'
require_relative 'j4/jour4'
require_relative 'j5/jour5'
require_relative 'j6/jour6'
require_relative 'j7/jour7'

module Main
  module CLI
    module Commands
      extend Dry::CLI::Registry

      class Version < Dry::CLI::Command
        desc "Print version"

        def call(*)
          puts "0.0.0"
        end
      end

      register "version", Version, aliases: ["v", "-v", "--version"]
      register "j1", Jour1
      register "j2", Jour2
      register "j3", Jour3
      register "j4", Jour4
      register "j5", Jour5
      register "j6", Jour6
      register "j7", Jour7
    end
  end
end
