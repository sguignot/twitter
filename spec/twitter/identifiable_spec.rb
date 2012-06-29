require 'helper'

describe Twitter::Identifiable do

  before do
  end

  describe "#==" do

    it "returns false for empty objects" do
      one = Twitter::Identifiable.new
      two = Twitter::Identifiable.new
      one.should_not eq two
    end

    it "returns true when objects IDs are the same" do
      one = Twitter::Identifiable.new(:id => 1, :screen_name => "sferik")
      two = Twitter::Identifiable.new(:id => 1, :screen_name => "garybernhardt")
      one.should eq two
    end

    it "returns false when objects IDs are different" do
      one = Twitter::Identifiable.new(:id => 1, :screen_name => "sferik")
      two = Twitter::Identifiable.new(:id => 2, :screen_name => "garybernhardt")
      one.should_not eq two
    end

    it "returns true when objects non-ID attributes are the same" do
      one = Twitter::Identifiable.new(:screen_name => "sferik")
      two = Twitter::Identifiable.new(:screen_name => "sferik")
      one.should eq two
    end

    it "returns false when objects non-ID attributes are different" do
      one = Twitter::Identifiable.new(:screen_name => "sferik")
      two = Twitter::Identifiable.new(:screen_name => "garybernhardt")
      one.should_not eq two
    end

  end

end
