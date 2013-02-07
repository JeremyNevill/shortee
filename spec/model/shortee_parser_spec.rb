require 'rspec'
require 'spec_helper'
require 'shortee/shortee_parser'

describe ShorteeParser do

  it "should parse @actor didto @actee 1x something 01/12/2012" do

    parser = ShorteeParser.new
    parsed_message = parser.parse("@actor didto @actee 1something 01/12/2012")
    parsed_message[:shortee][:actee][:actee].to_s.should eq("actee")

  end

end