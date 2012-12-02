require 'httparty'

SpotifyApiResponse = Struct.new(:count, :results)
SpotifyAlbum = Struct.new(:artists, :name, :spotify_href)
SpotifyArtist = Struct.new(:name, :spotify_href)

class SpotifyWebAPI
  include HTTParty
  base_uri 'http://ws.spotify.com'
  format :json

  def self.query_by_album(album)
    resp = get("/search/1/album.json", query: {q: album})
    SpotifyApiResponse.new(resp['info']['num_results'], get_albums(resp['albums']))
  end

  # def self.query_by_artist(artist)
  #   resp = get("/search/1/artist.json", query: {q: artist})
  #   SpotifyApiResponse.new(resp['info']['num_results'], get_artists(resp['albums']))
  # end

  private

  def self.get_albums(albums)
    albums.map do |album|
      artists = album['artists'].map {|artist| SpotifyArtist.new(artist['name'], artist['href']) }
      SpotifyAlbum.new(artists, album['name'], album['href'])
    end
  end
end

