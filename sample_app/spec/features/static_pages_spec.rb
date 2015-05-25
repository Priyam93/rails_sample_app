require 'spec_helper'

feature "Static pages", :type => :feature do

  feature "Home page", :type => :feature do

    scenario "should have the content 'Sample App'" do
      visit '/static_pages/home'
      page.should have_selector('h1', :text => 'Sample App')
    end

    scenario "should have the right title" do
    	visit '/static_pages/home'
    	page.source.should have_title("Ruby on Rails Tutorial Sample App | Home")
    end
  end
  
  describe "Help page", :type => :feature do

    scenario "should have the content 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('h1', :text => 'Help')
    end
  

    scenario "should have the right title" do
    	visit '/static_pages/help'
    	page.should have_title("Ruby on Rails Tutorial Sample App | Help")
  	end
  end

  describe "About page", :type => :feature do

    scenario "should have the content 'About'" do
      visit '/static_pages/About'
      page.should have_selector('h1', :text => 'About')
    end

    scenario "should have the right title" do
    	visit '/static_pages/About'
    	page.should have_title("Ruby on Rails Tutorial Sample App | About")
    end
  end
end
