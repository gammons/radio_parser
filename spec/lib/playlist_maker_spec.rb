require 'spec_helper'

class TestParser < Parser
  def get_songs
    [:one, :two]
  end

  def get_show_airdate
    Date.today.to_time
  end
end

describe PlaylistMaker do
  let(:html) { "<p>test</p>" }
  let(:show_name) { "James and Andy show" }
  subject { PlaylistMaker.new(show_name, html, TestParser) }

  it "creates a playlist" do
    subject.create_playlist!.should be_a_kind_of(Playlist)
  end

  let(:playlist) { subject.create_playlist! }
  it "makes a playlist with the songs it parsed" do
    playlist.songs.length.should eql(2)
    playlist.songs.should eql([:one, :two])
  end
end
