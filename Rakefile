require_relative 'lib/radio_parser'

require "rspec/core/rake_task"

desc "Creates a playlist"
task :create_playlist, [:url] do |t, args|
  $stdout << "Parsing html... "
  parser = WprbParser.new(HTTParty.get(args[:url]).body)
  $stdout << "done\n"

  $stdout << "Finding spotify song ids... "
  playlist = Playlist.new(parser.get_show_name + " " + parser.get_show_airdate, parser.get_songs)
  Spotify::Search.new.populate_spotify_song_ids!(playlist)
  $stdout << "done\n"

  $stdout << "Was able to find spotify songs for #{playlist.spotify_song_count} of #{playlist.songs.length} songs\n"

  $stdout << "Creating new spotify playlist... "
  Spotify::Playlist.new(playlist).create!
  $stdout << "done\n"
end

RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = %w[--format progress --color]
end

task :default => :spec
