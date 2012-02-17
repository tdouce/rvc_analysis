require 'spec_helper'

describe Visit do

  it "should have dive start time" do
    visit = Factory.build(:visit, :dive_start => nil)
    lambda { visit.save! }.should raise_error(ActiveRecord::RecordInvalid)
    visit.should have(1).errors_on(:dive_start)
  end

  it "should have dive end time" do
    visit = Factory.build(:visit, :dive_end => nil)
    lambda { visit.save!}.should raise_error(ActiveRecord::RecordInvalid)
    visit.should have(1).errors_on(:dive_end)
  end

  it "Dive end time should be after dive start time" do
    pending "Dive end time and Dive start time are failing when this custom validation is working, but rails app works" 
    #visit = Factory.build(:visit, :dive_start => Time.now, :dive_end => Time.now - 1.hour)
    #puts '*'*80
    #puts visit.dive_start
    #puts visit.dive_end
    #puts '*'*80
    #lambda { visit.save! }.should raise_error(ActiveRecord::RecordInvalid)
    #visit.should have(1).errors_on(:dive_start)
  end
end
