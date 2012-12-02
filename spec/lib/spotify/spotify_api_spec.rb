require 'spec_helper'
require_relative 'spotify_api_behaviors'

describe SpotifyWebAPI do

  subject { SpotifyWebAPI }

  describe "query by album" do
    use_vcr_cassette 'query_by_album'

    let(:response) { subject.query_by_album('Radio Activity') }
    let(:album) { response.results.first }

    it_behaves_like 'a spotify response'

    describe "albums" do
      it_behaves_like "a name and spotify_id structure" do 
        let(:item) { album }
      end
    end

    describe "album artists" do
      let(:artist) { album.artists.first }
      it_behaves_like 'a name and spotify_id structure' do
        let(:item) { artist }
      end

      it "should have artists" do
        album.should respond_to(:artists)
      end
    end
  end
end
