require 'rubygems'
require_relative 'lib/radio_parser'

require "rspec/core/rake_task"

desc "Creates a playlist"
task :create_playlist, :file do |t, args|
  playlist = PlaylistMaker.new("James and andy", File.read(args[:file]), WprbParser).create_playlist!
  p playlist
end

RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = %w[--format progress --color]
end

task :default => :spec
