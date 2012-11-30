class Song
  attr_accessor :artist, :song, :album, :label

  def initialize(opts)
    @artist = opts[:artist]
    @song = opts[:song]
    @album = opts[:album]
    @label = opts[:label]
  end
end
