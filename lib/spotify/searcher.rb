require 'hallon'

# SpotifyApiResponse = Struct.new(:count, :results)
# SpotifyAlbum = Struct.new(:artists, :name, :spotify_href)
# SpotifyArtist = Struct.new(:name, :spotify_href)

class Searcher
  def initialize
    @session = Session.instance.get_session
  end

  def search_for_track(track_name, album_name)
    find_track_on_album(track_name, query_by_album(album_name))
  end

  private

  def query_by_album(album_name)
    albums = Hallon::Search.new(album_name, tracks: 100, tracks_offset: 0).load.albums
    find_album_specifically_by_album_name(albums, album_name)
  end

  def find_album_specifically_by_album_name(albums, album_name)
    albums.find {|album| album.load.name == album_name }
  end

  def find_track_on_album(track_name, album)
    album.browse.load.tracks.find {|track| track.name == track_name }
  end
end

