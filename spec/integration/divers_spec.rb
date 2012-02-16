require 'spec_helper'

describe "diver" do

  describe "CRUD" do

    it "should redirect to index when create succedes" do
      diver = Factory.create(:diver)
      visit(new_diver_url)
      fill_in('diver_first_name', :with => diver.first_name )
      fill_in('diver_last_name',  :with => diver.last_name )
      click_button('Create Diver')
      current_url.should == divers_url
    end

    it "should redirect to new when create fails" do
      diver = Factory.create(:diver)
      visit(new_diver_url)
      fill_in('diver_first_name', :with => diver.first_name )
      fill_in('diver_last_name',  :with => nil )
      click_button('Create Diver')
      page.should have_content "Diver was NOT created!"
    end
  end
end
