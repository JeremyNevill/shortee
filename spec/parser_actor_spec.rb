require 'rspec'
require 'spec_helper'
require 'shortee'

describe Shortee::Parser do

  it "parses lowercase actor" do
    test_message="@freddie ate 1cheese 01/jan/2013"
    parser = Shortee::Parser.new(Shortee::LittleEndianParser.new)
    parsed_message = parser.parse(test_message)
    parsed_message[:short][:mainactor][:actor].to_s.should eq("freddie")
  end

  it "parses upperase actor" do
    test_message="@ROD ate 1cheese 01/jan/2013"
    parser = Shortee::Parser.new(Shortee::LittleEndianParser.new)
    parsed_message = parser.parse(test_message)
    parsed_message[:short][:mainactor][:actor].to_s.should eq("ROD")
  end

  it "parses mixed case actor" do
    test_message="@Jane ate 1cheese 01/jan/2013"
    parser = Shortee::Parser.new(Shortee::LittleEndianParser.new)
    parsed_message = parser.parse(test_message)
    parsed_message[:short][:mainactor][:actor].to_s.should eq("Jane")
  end

end
