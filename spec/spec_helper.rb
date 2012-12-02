require 'rubygems'
require 'vcr'

require 'playlist_maker'
require 'parser'
require 'parsers/wprb_parser'
require 'spotify/spotify_web_api'
require 'spotify/track_finder'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :webmock
end

RSpec.configure do |c|
    c.extend VCR::RSpec::Macros
end
