require 'spec_helper'
require 'features/shared/login_helper'
include LoginHelper

describe 'Session' do

  describe 'GET /' do
    it 'displays a login link', :js => true do
      visit root_path
      page.should have_link('Login')
    end
  end

  describe 'GET /login' do
    it 'it displays a login form on click', :js => true do
      visit root_path
      click_link('Login')
      page.should have_button('Get LOST')
    end
  end

  describe 'POST /login' do
    it 'logs the user into the system if the credentials are correct', :js => true do
      user = FactoryGirl.create(:user)
      visit root_path
      login_to_system(user)
      page.should_not have_button('Login')
      page.should have_link("Logout: #{user.name}")
      page.should_not have_link('Register')
      visit root_path
      page.should_not have_link('Register')
      page.should_not have_link('Login')
    end

    it 'does not log the user into the system if credentials are incorrect', :js => true do
        visit root_path
        click_link('Login')
        fill_in('Email', :with => 'generic@gmail.com')
        fill_in('Password', :with => 'b')
        click_link('Login')
        page.should have_link('Login')
      end
    end

  describe 'DELETE /login' do
    it 'logs the user off the system', :js => true do
      user = FactoryGirl.create(:user)
      visit root_path
      login_to_system(user)
      click_link("Logout: #{user.name}")
      page.should_not have_link("Logout: #{user.name}")
      page.should have_link('Register')
      page.should_not have_link('Planes')
      page.should_not have_link('Search')
      page.should_not have_content('Get LOST')
      visit root_path
      page.should_not have_link("Logout: #{user.name}")
      page.should have_link('Login')
      page.should_not have_link('Flights')
      page.should_not have_link('Search')
    end
  end

  describe 'JS cancel_login_form()' do
    it 'removes the login form', :js => true do
      visit root_path
      click_link('Login')
      click_link('Cancel')
      page.should_not have_content('Get LOST')
    end
  end
end