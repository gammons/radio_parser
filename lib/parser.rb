require 'rubygems'
require 'nokogiri'

require 'playlist'
require 'song'

class Parser
  attr_reader :airdate
  attr_reader :playlist

  def initialize(doc)
    @raw = doc
    @doc = Nokogiri::HTML(doc)
    @playlist = Playlist.new
  end

  def parse!
    find_table
    @playlist.airdate = get_show_airdate
    get_songs_from_table
  end

  private

  def find_table
    @table = @doc.xpath('//table/tr')
  end

  def get_songs_from_table
    @table.each_with_index do |tr, index|
      next if index == 0

      artist = get_artist(tr)
      unless blank? artist
        song = Song.new(artist: artist,
                        song: get_song(tr),
                        album: get_album(tr),
                        label: get_label(tr))

        @playlist.songs << song
      end
    end
  end

  def get_artist(tr)
    tr.children.first.text
  end

  def get_song(tr)
    tr.children[2].children[0].text
  end

  def get_album(tr)
    tr.children[4].children[0].text
  end

  def get_label(tr)
    tr.children[6].text
  end

  def get_show_airdate
    @doc.at_css('p span.text').children[0].text
  end

  def blank?(str)
    str == '' or str.nil?
  end
end


