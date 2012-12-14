require 'spec_helper'

describe Searcher do
  describe "#query_by_album" do
    it "should query by album" do
      p subject.search_for_track("Shore Lined Poison", "Too Dark Park")
    end
  end
end

