module Spotify
  Url = "https://api.spotify.com/v1"

  def self.get(url, params = nil)
    HTTParty.get(url, query: params, header: "Authorization: Bearer #{ENV['SPOTIFY_API_TOKEN']}")
  end
end
