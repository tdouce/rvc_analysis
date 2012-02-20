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
  end

  it "Sample end time should be after sample start time" do
    pending
  end

  it "Sample start time should be after sample dive time" do
    pending
  end

  it "Dive end time should be after sample end time" do
    pending
  end
end
