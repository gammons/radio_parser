require_relative 'playlist'
class PlaylistMaker
  def initialize(show_name, html, parser)
    @show_name = show_name
    @html = html
    @parser = parser.new(html)
  end

  def create_playlist!
    songs = @parser.get_songs
    airdate = @parser.get_show_airdate
    Playlist.new(@show_name, songs, airdate)
  end
end
