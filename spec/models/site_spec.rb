require 'spec_helper'

describe Site do
  it "should require name" do
    site = Factory.build(:site, :name => nil)
    lambda { site.save! }.should raise_error(ActiveRecord::RecordInvalid)
    site.should have(1).errors_on(:name)
  end
end
