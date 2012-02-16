require 'spec_helper'

# Tests the model, (i.e. validations and methods)

describe Diver do

  it "should require first_name" do
    diver = Factory.build(:diver, :first_name => nil)
    lambda { diver.save! }.should raise_error(ActiveRecord::RecordInvalid)
    diver.should have(1).errors_on(:first_name)
  end

  it "should require last_name" do
    diver = Factory.build(:diver, :last_name => nil)
    lambda { diver.save! }.should raise_error(ActiveRecord::RecordInvalid)
    diver.should have(1).errors_on(:last_name)
  end
end
