require 'rspec'
require 'spec_helper'
require 'shortee'

describe Shortee::ShorteeParser do

  it "should parse an actee" do
    test_message="@actor didto @actee 1something 01/12/2012"
    parser = Shortee::ShorteeParser.new
    parsed_message = parser.parse(test_message)
    parsed_message[:shortee][:actee][:actee].to_s.should eq("actee")
  end

  it "should parse another actee" do
    test_message="@actor didto @jimboWilliams 1something 01/jan/2012"
    parser = Shortee::ShorteeParser.new
    parsed_message = parser.parse(test_message)
    parsed_message[:shortee][:actee][:actee].to_s.should eq("jimboWilliams")
  end

  it "should parse a valid actee" do
    test_message="@actor gave @frank 2cheeses 01/jan/2012"
    parser = Shortee::ShorteeParser.new
    parsed_message = parser.parse(test_message)
    parsed_message[:shortee][:actee][:actee].to_s.should eq("frank")
  end

  it "should parse a valid mainactor" do
    test_message="@somebody did 1thing 01/jan/2012"
    parser = Shortee::ShorteeParser.new
    parsed_message = parser.parse(test_message)
    parsed_message[:shortee][:mainactor][:actor].to_s.should eq("somebody")
  end

  it "should parse a valid action" do
    test_message="@somebody did 1thing 01/jan/2012"
    parser = Shortee::ShorteeParser.new
    parsed_message = parser.parse(test_message)
    parsed_message[:shortee][:action].to_s.should eq("did")
  end

  it "should parse a valid amount" do
    test_message="@somebody did 1thing 01/jan/2012"
    parser = Shortee::ShorteeParser.new
    parsed_message = parser.parse(test_message)
    parsed_message[:shortee][:amountnum].should eq("1")
  end

  it "should parse a valid full date" do
    test_message="@somebody did 1thing 01/jan/2012"
    parser = Shortee::ShorteeParser.new
    parsed_message = parser.parse(test_message)
    parsed_message[:shortee][:day].should eq("01")
    parsed_message[:shortee][:month].should eq("jan")
    parsed_message[:shortee][:year].should eq("2012")
  end

  it "should parse a valid UK date" do
    test_message="@somebody did 1thing 01/12/2012"
    parser = Shortee::ShorteeParser.new
    parsed_message = parser.parse(test_message)
    parsed_message[:shortee][:day].should eq("01")
    parsed_message[:shortee][:ukmonth].should eq("12")
    parsed_message[:shortee][:year].should eq("2012")
  end

  it "should parse another valid UK date" do
    test_message="@frankee ate 2cheeses 13/01/2012"
    parser = Shortee::ShorteeParser.new
    parsed_message = parser.parse(test_message)
    parsed_message[:shortee][:day].should eq("13")
    parsed_message[:shortee][:ukmonth].should eq("01")
    parsed_message[:shortee][:year].should eq("2012")
  end

end