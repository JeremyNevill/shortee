require 'rspec'
require 'spec_helper'
require 'shortee'

describe Shortee::ShorteeParser do

  it "should parse an actee" do
    parser = Shortee::ShorteeParser.new
    parsed_message = parser.parse("@fred didto @actee 1something 01/12/2012")
    parsed_message[:shortee][:mainactor][:actor].to_s.should eq("fred")
  end

  it "should parse an actee" do
    parser = Shortee::ShorteeParser.new
    parsed_message = parser.parse("@actor didto @james 1something 01/jan/2012")
    parsed_message[:shortee][:actee][:actee].to_s.should eq("james")
  end

end