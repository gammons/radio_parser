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
    expect(subject.create_playlist!).to be_a_kind_of(Playlist)
  end

  let(:playlist) { subject.create_playlist! }
  it "makes a playlist with the songs it parsed" do
    expect(playlist.songs.length).to eql(2)
    expect(playlist.songs).to eql([:one, :two])
  end
end
