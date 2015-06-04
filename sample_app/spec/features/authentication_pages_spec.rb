require 'spec_helper'

feature "Authentication", :type => :feature do

  subject { page }

  describe "signin page", :type => :feature do
    before { visit signin_path }

    scenario "should have the content 'Sign in'" do
      page.should have_selector('h1', :text => 'Sign in')
    end

    scenario "should have the title 'Sign in'" do
      page.should have_title('Sign in')
    end
  end

  describe "signin" do

    before { visit signin_path }

    describe "with invalid information" do
      before { click_button "Sign in" }

      scenario "should have the content 'Sign in'" do
        page.should have_title('Sign in')
        page.should have_selector('div.alert.alert-error', :text => 'Invalid')
      end

      describe "after visiting another page" do
        before { click_link "Home" }
        it { should_not have_selector('div.alert.alert-error') }
      end
    end

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Email",    with: user.email.upcase
        fill_in "Password", with: user.password
        click_button "Sign in"
      end

      it { should have_title(user.name) }
      it { should have_link('Profile',     href: user_path(user)) }
      it { should have_link('Settings',    href: edit_user_path(user)) }
      it { should have_link('Sign out',    href: signout_path) }
      it { should_not have_link('Sign in', href: signin_path) }

    end
  end

  describe "authorization" do

    describe "for non-signed-in users" do
      let(:user) { FactoryGirl.create(:user) }

      describe "in the Users controller" do

        describe "visiting the edit page" do
          before { visit edit_user_path(user) }
          it { should have_title('Sign in') }
        end

        describe "submitting to the update action" do
          before { put user_path(user) }
          specify { response.should redirect_to(signin_path) }
        end

        describe "visiting the user index" do
          before { visit users_path }
          it { should have_title('Sign in') }
        end
      end
    end
  end
end
