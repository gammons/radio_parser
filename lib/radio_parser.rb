require 'rubygems'

require_relative 'playlist'
require_relative 'song'

require_relative 'parser'
Dir["#{File.expand_path(File.dirname(__FILE__))}/parsers/*.rb"].each {|file| require file }
Dir["#{File.expand_path(File.dirname(__FILE__))}/spotify/*.rb"].each {|file| require file }
