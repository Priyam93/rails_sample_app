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

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in("Name", with: 'Example user', :match => :prefer_exact)
        fill_in("Email", with: 'user@example.com', :match => :prefer_exact)
        fill_in("Password", with: 'foobar', :match => :prefer_exact)
        fill_in("Confirmation", with: 'foobar', :match => :prefer_exact)
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end

end
