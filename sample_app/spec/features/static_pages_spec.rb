require 'spec_helper'

feature "Static pages", :type => :feature do

  describe "Home page", :type => :feature do
    before { visit root_path }

    scenario "should have the content 'Sample App'" do
      page.should have_selector('h1', :text => 'Sample App')
    end

    scenario "should have the right title" do
    	page.source.should_not have_title("| Home")
    end

    scenario "should have the right base title" do
      page.source.should have_title('Ruby on Rails Tutorial Sample App')
    end
  end
  
  describe "Help page", :type => :feature do
    before { visit help_path }

    scenario "should have the content 'Help'" do
      page.should have_selector('h1', :text => 'Help')
    end
  
    scenario "should have the right title" do
      page.source.should_not have_title("| Help")
    end

    scenario "should have the right base title" do
    	page.should have_title("Ruby on Rails Tutorial Sample App")
  	end
  end

  describe "About page", :type => :feature do
    before { visit about_path}

    scenario "should have the content 'About'" do
      page.should have_selector('h1', :text => 'About')
    end

    scenario "should have the right title" do
      page.source.should_not have_title("| About")
    end

    scenario "should have the right title" do
    	page.should have_title("Ruby on Rails Tutorial Sample App")
    end
  end

  describe "Contact page", :type => :feature do
    before { visit contact_path }

    scenario "should have the content 'Contact'" do
      page.should have_selector('h1', :text => 'Contact')
    end

    scenario "should have the right title" do
      page.source.should_not have_title("| Contact")
    end

    scenario "should have the right title" do
      page.should have_title("Ruby on Rails Tutorial Sample App")
    end
  end

end
