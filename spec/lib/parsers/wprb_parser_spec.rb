require 'parser'
require 'parsers/wprb_parser'

describe WprbParser do
  subject { WprbParser.new(File.read('spec/support/playlist.php')) }
  let(:first_song) { Song.new("Jack Dixon", "E", "E/Find Shelter", "Hotflush") }
  let(:song_count) { 22 }

  it "should new" do
    lambda { subject }.should_not raise_error
  end

  it "should parse songs" do
    subject.get_songs.length.should eql(song_count)
    subject.get_songs.first.to_hash.should == first_song.to_hash
  end
end
