require 'rspec'
require 'spec_helper'
require 'shortee'

describe Shortee::Parser do

  it "parses a mainactor" do
    test_message="@somebody did 1thing 01/jan/2012"
    parser = Shortee::Parser.new(Shortee::LittleEndianParser.new)
    parsed_message = parser.parse(test_message)
    parsed_message[:short][:mainactor][:actor].to_s.should eq("somebody")
  end

  it "parses an actee" do
    test_message="@actor didto @actee 1something 01/12/2012"
    parser = Shortee::Parser.new(Shortee::LittleEndianParser.new)
    parsed_message = parser.parse(test_message)
    parsed_message[:short][:actee][:actee].to_s.should eq("actee")
  end

  it "parses another actee" do
    test_message="@actor didto @jimboWilliams 1something 01/jan/2012"
    parser = Shortee::Parser.new(Shortee::LittleEndianParser.new)
    parsed_message = parser.parse(test_message)
    parsed_message[:short][:actee][:actee].to_s.should eq("jimboWilliams")
  end

  it "parses an action" do
    test_message="@somebody did 1thing 01/jan/2012"
    parser = Shortee::Parser.new(Shortee::LittleEndianParser.new)
    parsed_message = parser.parse(test_message)
    parsed_message[:short][:action].to_s.should eq("did")
  end

  it "parses an amount" do
    test_message="@somebody did 1thing 01/jan/2012"
    parser = Shortee::Parser.new(Shortee::LittleEndianParser.new)
    parsed_message = parser.parse(test_message)
    parsed_message[:short][:amountnum].should eq("1")
  end

  it "parses a 1 decimal place amount" do
    test_message="@somebody did 0.2things 01/jan/2012"
    parser = Shortee::Parser.new(Shortee::LittleEndianParser.new)
    parsed_message = parser.parse(test_message)
    parsed_message[:short][:amountnum].should eq("0.2")
  end

  it "parses a unit" do
    test_message="@somebody did 1jibberjabber 01/jan/2012"
    parser = Shortee::Parser.new(Shortee::LittleEndianParser.new)
    parsed_message = parser.parse(test_message)
    parsed_message[:short][:amountunits].should eq("jibberjabber")
  end

  it "parses a unit with a space before it" do
    test_message="@somebody did 1 jibberjabber 01/jan/2012"
    parser = Shortee::Parser.new(Shortee::LittleEndianParser.new)
    parsed_message = parser.parse(test_message)
    parsed_message[:short][:amountunits].should eq("jibberjabber")
  end

  it "parses a full standard uk date dd/mmm/yyyy" do
    test_message="@somebody did 1thing 01/jan/2012"
    parser = Shortee::Parser.new(Shortee::LittleEndianParser.new)
    parsed_message = parser.parse(test_message)
    parsed_message[:short][:day].should eq("01")
    parsed_message[:short][:month].should eq("jan")
    parsed_message[:short][:year].should eq("2012")
  end

  it "parses a UK numeric date" do
    test_message="@somebody did 1thing 01/12/2012"
    parser = Shortee::Parser.new(Shortee::LittleEndianParser.new)
    parsed_message = parser.parse(test_message)
    parsed_message[:short][:day].should eq("01")
    parsed_message[:short][:month].should eq("12")
    parsed_message[:short][:year].should eq("2012")
  end

  it "parses another UK numeric date" do
    test_message="@frankee ate 2cheeses 13/01/2012"
    parser = Shortee::Parser.new(Shortee::LittleEndianParser.new)
    parsed_message = parser.parse(test_message)
    parsed_message[:short][:day].should eq("13")
    parsed_message[:short][:month].should eq("01")
    parsed_message[:short][:year].should eq("2012")
  end
   
  it "parses another UK numeric date with actee" do
    test_message="@bill won @theoscars 2awards 23/07/2015"
    parser = Shortee::Parser.new(Shortee::LittleEndianParser.new)
    parsed_message = parser.parse(test_message)
    parsed_message[:short][:day].should eq("23")
    parsed_message[:short][:month].should eq("07")
    parsed_message[:short][:year].should eq("2015")
  end

end
