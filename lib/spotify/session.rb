require 'singleton'
require 'hallon'

class Session
  include Singleton

  def get_session
    @session ||= initialize_session
  end

  private

  def initialize_session
    p "key path = #{ENV['SPOTIFY_KEY_PATH']}"
    @session = Hallon::Session.initialize IO.read(ENV['SPOTIFY_KEY_PATH'])
    @session.login! ENV['SPOTIFY_USERNAME'], ENV['SPOTIFY_PASSWORD']

  end
end
