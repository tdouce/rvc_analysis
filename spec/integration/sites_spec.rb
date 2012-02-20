require 'spec_helper'

describe "site" do

  describe "CRUD" do

    it "should redirect to index when create succedes" do
      site = Factory.create(:site)
      visit(new_site_url)
      fill_in('site_name', :with => site.name )
      click_button('Create Site')
      current_url.should == sites_url
    end

    it "should redirect to new when create fails" do
      site = Factory.create(:site)
      visit(new_site_url)
      fill_in('site_name', :with => nil )
      click_button('Create Site')
      page.should have_content "Site was NOT created!"
    end
  end

  describe "index" do
    it "should have site name" do
      site = Factory.create(:site)
      visit(sites_url)
      page.should have_content site.name
    end
  end
end
