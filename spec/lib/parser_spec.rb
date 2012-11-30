require 'parser'

describe Parser do
  subject { Parser.new(File.read('spec/support/playlist.php')) }
  it "should new" do
    lambda { subject }.should_not raise_error
  end

  it "should parse" do
    subject.parse!
    p subject.playlist
  end
end
