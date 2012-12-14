require 'spec_helper'
describe Spotify::Session do
  subject { Spotify::Session }

  it "should get the session" do
    subject.instance.get_session
  end
end
