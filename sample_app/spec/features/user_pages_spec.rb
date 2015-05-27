require 'spec_helper'

feature "User pages", :type => :feature do

  describe "signup page", :type => :feature do
    before { visit signup_path }

    	scenario "should have signup" do
    	page.should have_selector('h1', text: 'Sign up')
	end
	
		scenario "should have title" do
    	page.should have_title("Ruby on Rails Tutorial Sample App")
  	end
	end
end