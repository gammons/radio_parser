class Playlist
  attr_reader :songs, :airdate, :name

  def initialize(name, songs, airdate)
    @name, @songs, @airdate = name, songs, airdate
  end
end
