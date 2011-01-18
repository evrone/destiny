require File.dirname(__FILE__) + '/spec_helper'

describe Object do
  
  it "should respond to Dice" do
    subject.should respond_to :Dice
  end
  
  it "should return Fixnum" do
    Dice("1d6").should be_kind_of Fixnum
  end
  
  it "should raise an exception if wrong format" do
    lambda {
      Dice("fail")
    }.should raise_error
  end
  
  context "without addition" do
    it "should be able to parse 1d6" do
      (1..6).should include Dice("1d6")
    end
    
    it "should be able to parse 2d10" do
      (2..20).should include Dice("2d10")
    end
    
    it "should be able to parse 3d14" do
      (3..42).should include Dice("3d14")
    end
  end
  
  context "with addition to all" do
    it "should be able to parse 1d10+1" do
      (2..11).should include Dice("1d10+1")
    end
    
    it "should be able to parse 3d6+5" do
      (8..23).should include Dice("3d6+5")
    end
    
    it "should be able to parse 5d5+5" do
      (10..30).should include Dice("5d5+5")
    end
  end
  
  context "with addition to each" do
    it "should be able to parse 2d(6+1)" do
      (6..16).should include Dice("2d(6+2)")
    end
    it "should be able to parse 2d(10+1)" do
      (4..22).should include Dice("2d(10+1)")
    end
    
    it "should be able to parse 3d(6+5)" do
      (18..33).should include Dice("3d(6+5)")
    end
  end
  
  
end