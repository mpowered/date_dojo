require "date_ninja"

describe DateNinja::DateDojo do
  it "check date is a string" do
  	DateNinja::DateDojo.date_kung_fu("2013/03/05").should eql("string_date")
  end

  it "check date is anything else" do
  	DateNinja::DateDojo.date_kung_fu("2013/03/05".to_i).should eql("numeric_date")
  end
end