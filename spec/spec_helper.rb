require 'rubygems'
require 'vcr'

require 'radio_parser'
require 'pry'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :webmock
end

RSpec.configure do |c|
    c.extend VCR::RSpec::Macros
end
