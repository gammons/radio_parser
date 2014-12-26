class Song
  attr_reader :artist, :song, :album, :label

  def initialize(artist, song, album, label)
    @artist = artist
    @song = song
    @album = album
    @label = label
  end

  def to_hash
    {artist: artist, song: song, album: album, label: label}
  end
end
