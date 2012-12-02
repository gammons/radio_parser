shared_examples 'a spotify response' do
  it "returns a count" do
    response.should respond_to(:count)
  end

  it "has results" do
    response.should respond_to(:results)
  end
end

shared_examples 'a name and spotify_id structure' do
  describe "name" do
    it "has a name" do
      item.should respond_to(:name)
    end

    it "should be populated" do
      item.name.should_not be_nil
    end
  end

  describe "spotify_href" do
    it "has a spotify href" do
      item.should respond_to(:spotify_href)
    end

    it "should be populated" do
      item.spotify_href.should_not be_nil
    end
  end
end
