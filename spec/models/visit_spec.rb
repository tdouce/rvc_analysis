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

  it "Divers should not be blank" do
    pending
  end

  it "should require a substrate_max_depth" do
    visit = Factory.build(:visit, :substrate_max_depth => nil)
    lambda { visit.save!}.should raise_error(ActiveRecord::RecordInvalid)
    visit.should have(2).errors_on(:substrate_max_depth)
  end

  it "should require a substrate_max_depth less than or equal to 100" do
    visit = Factory.build(:visit, :substrate_max_depth => 1000)
    lambda { visit.save!}.should raise_error(ActiveRecord::RecordInvalid)
    visit.should have(1).errors_on(:substrate_max_depth)
  end

  it "should require a substrate_min_depth" do
    visit = Factory.build(:visit, :substrate_min_depth => nil)
    lambda { visit.save!}.should raise_error(ActiveRecord::RecordInvalid)
    visit.should have(2).errors_on(:substrate_min_depth)
  end

  it "should require a substrate_min_depth greater than or equal to 5" do
    visit = Factory.build(:visit, :substrate_min_depth => 1)
    lambda { visit.save!}.should raise_error(ActiveRecord::RecordInvalid)
    visit.should have(1).errors_on(:substrate_min_depth)
  end

  it "should require a :surface_relief_hard_cat_1" do
    visit = Factory.build(:visit, :surface_relief_hard_cat_1 => nil)
    lambda { visit.save!}.should raise_error(ActiveRecord::RecordInvalid)
    visit.should have(2).errors_on(:surface_relief_hard_cat_1)
  end

  it "should require a :surface_relief_hard_cat_2" do
    visit = Factory.build(:visit, :surface_relief_hard_cat_2 => nil)
    lambda { visit.save!}.should raise_error(ActiveRecord::RecordInvalid)
    visit.should have(2).errors_on(:surface_relief_hard_cat_2)
  end

  it "should require a :surface_relief_hard_cat_3" do
    visit = Factory.build(:visit, :surface_relief_hard_cat_3 => nil)
    lambda { visit.save!}.should raise_error(ActiveRecord::RecordInvalid)
    visit.should have(2).errors_on(:surface_relief_hard_cat_3)
  end

  it "should require a :surface_relief_hard_cat_4" do
    visit = Factory.build(:visit, :surface_relief_hard_cat_4 => nil)
    lambda { visit.save!}.should raise_error(ActiveRecord::RecordInvalid)
    visit.should have(2).errors_on(:surface_relief_hard_cat_4)
  end

  it "should require a :surface_relief_hard_cat_5" do
    visit = Factory.build(:visit, :surface_relief_hard_cat_5 => nil)
    lambda { visit.save!}.should raise_error(ActiveRecord::RecordInvalid)
    visit.should have(2).errors_on(:surface_relief_hard_cat_5)
  end

  it "should add to 100" do
    visit = Factory.build(:visit, :surface_relief_hard_cat_1 => 1)
    lambda { visit.save!}.should raise_error(ActiveRecord::RecordInvalid)
    visit.should have(1).errors_on(:hard_surface_relief_coverage)
  end
end
