require 'rspec'
require 'spec_helper'
require 'shortee'

describe Shortee::Parser do

  it "parses a short with initial spaces" do
    test_message ="  @DateBoy tried 2things 01/sep/2013"
    parser = Shortee::Parser.new(Shortee::LittleEndianParser.new)
    parsed_message = parser.parse(test_message)
    parsed_message[:short][:mainactor][:actor].to_s.should eq("DateBoy")
  end

  it "parses a short with a trailing space" do
    test_message ="@DateBoy tried 2things 01/sep/2013 "
    parser = Shortee::Parser.new(Shortee::LittleEndianParser.new)
    parsed_message = parser.parse(test_message)
    parsed_message[:short][:mainactor][:actor].to_s.should eq("DateBoy")
  end

end
