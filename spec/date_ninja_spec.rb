require "date_ninja"

describe DateDojo::DateSensei do
  it "checks that string dates are correct" do
  	DateDojo::DateSensei.date_format_validation("05/05/2013").should == "05/05/2013".to_date
  end

  it "checks that string dates are in the correct format" do
  	expect { DateDojo::DateSensei.date_format_validation("20113/03/05") }.to raise_error("incorrect date format")
  end

  it "checks that string numeric values are correct" do
  	DateDojo::DateSensei.date_format_validation("56140").should == Date.new(1900,1,1) + "56140".to_i - 2
  end

  it "checks that string numeric values from incorrect formats" do
  	expect { DateDojo::DateSensei.date_format_validation("654585") }.to raise_error("incorrect date format")
  end

  it "checks that numeric values make up the correct date formats" do
  	DateDojo::DateSensei.date_format_validation(56140).should == Date.new(1900,1,1) + 56138
  end

  it "checks that numeric values make up the correct date formats" do
  	expect { DateDojo::DateSensei.date_format_validation(654585) }.to raise_error("incorrect date format")
  end

  it "any dates passed into rails will be saved in the correct format returns same date" do
  	DateDojo::DateSensei.date_format_validation(Date.today).should == Date.today
  end

  it "checks that dates with cross formatted dates that cant be parsed to raise an error" do
    expect { DateDojo::DateSensei.date_format_validation("27-08.2014") }.to raise_error("incorrect date format")
  end
end