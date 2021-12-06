#!/usr/bin/env ruby
require "bundler/setup"
require "dry/cli"
require_relative 'j2/jour2'

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
      register "j2", Jour2
    end
  end
end
