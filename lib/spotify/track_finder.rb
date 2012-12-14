require_relative 'searcher'

class TrackFinder
  def initialize(song)
    @song = song
  end

  def get_spotify_uri
    albums = SpotifyWebAPI.query_by_album(@song.album)
  end
end
